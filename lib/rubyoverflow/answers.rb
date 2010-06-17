module Rubyoverflow
  class Answers < PagedBase
    attr_reader :answers
  
    def initialize(hash, request_path = '')
      dash = AnswersDash.new hash
    
      @answers = Array.new
      dash.answers.each {|answerHash| @answers.push(Answer.new answerHash)}
    
      super(dash, request_path)
    end
  
    #Retrieves the next set of answers using the same parameters used to retrieve the current set
    def get_next_set
      hash,url = perform_next_page_request
      Answers.new hash,url
    end
    
    class << self
    
      #Retrieves a set of questions by their id(s)
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to '/answers/{id}'
      def retrieve_by_id(id, parameters = {})
        id = convert_if_array(id)
        hash,url = request('answers/'+id.to_s, parameters)
        Answers.new hash,url
      end
    
      #Retrieves a set of answers made by a set of users by their ids
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to 'users/{id}/answers'
      def retrieve_by_user(id, parameters={})
        id = convert_if_array(id)
        hash, url = request('users/'+id.to_s+"/answers", parameters)
        Answers.new hash, url
      end
    
      #Retrieves a set of answers from a set of questions by the questions' ids
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to 'questions/{id}/answers'
      def retrieve_by_question(id, parameters={})
        id = convert_if_array(id)
        hash, url = request('questions/'+id.to_s+"/answers", parameters)
        Answers.new hash, url
      end
    end
  end

  class AnswersDash < PagedDash
    property :answers
  end
end