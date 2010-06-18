module Rubyoverflow
  class Questions < PagedBase
    attr_reader :questions
  
    def initialize(hash, request_path = '')
      dash = QuestionsDash.new hash
    
      @questions = Array.new
      dash.questions.each {|questionHash| @questions.push (Question.new questionHash)}
    
      super(dash,request_path)
    end
    
    #Retrieves the next set of questions using the same parameters used to retrieve the current set
    def get_next_set
      hash,url = perform_next_page_request
      Questions.new hash,url
    end
  
    class << self
    
      #Retrieves all questions using the parameters provided
      #
      #Maps to '/questions'
      def retrieve_all(parameters = {})
        hash, url = request('questions',parameters)
        Questions.new hash, url
      end
    
      #Retrieves a set of questions by their id(s)
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to '/questions/{id}'
      def retrieve_by_id(id, parameters = {})
        id = convert_if_array(id)
      
        hash, url = request('questions/' + id.to_s, parameters)
        Questions.new hash, url
      end
    
      #Retrieves a set of questions by their tag(s)
      #
      #tag can be a string or an array of strings, tag(s) should be URL Encoded
      #
      #Maps to '/questions/tagged/{tags}
      def retrieve_by_tag(tags, parameters = {})
        tags = convert_if_array(tags)
      
        hash, url = request('questions/tagged/' + tags.to_s, parameters)
        Questions.new hash, url
      end
    
      #Retieves a set of unanswered questions using the parameters provided
      #
      #Maps to '/questions/unanswered'
      def retrieve_unanswered(parameters = {})
        hash, url = request('questions/unanswered', parameters)
        Questions.new hash, url
      end
    
      #Retrieves a set of favorite questions for user(s) by the users' id(s)
      #
      #user_id can be an int, string, or an array of ints or strings
      #
      #Maps to '/users/{id}/favorites
      def retrieve_favorites(user_id, parameters = {})
        user_id = convert_if_array(user_id)
      
        hash, url = request('users/'+user_id.to_s+'/favorites', parameters)
        Questions.new hash, url
      end
    
      #Retrieve question summary for user(s) by their id(s)
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to '/users/{id}/questions'
      def retrieve_by_user(id, parameters = {})
        id = convert_if_array(id)
      
        hash, url = request('users/'+id.to_s+'/questions', parameters)
        Questions.new hash, url
      end
    
      #Searches questions. One of intitle, tagged, or nottagged must be set.
      #
      #Example: Questions.search({:tagged=>'c%23',:nottagged=>'sql;asp.net'})
      #
      #Maps to '/search'
      def search(parameters = {})
        hash, url = request('search', parameters)
        Questions.new hash, url
      end
    
    end
  

  end

  class QuestionsDash < PagedDash
    property :questions
  end
end