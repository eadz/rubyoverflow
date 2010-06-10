class Questions < PagedBase
  attr_reader :questions
  
  def initialize(hash)
    @dash = QuestionsDash.new hash
    
    @questions = @dash.questions
    
    super(@dash)
  end
  
  class << self
    
    #Retrieves all questions using the parameters provided
    #
    #Maps to '/questions'
    def retrieve_all(parameters = {})
      Questions.new request('questions',parameters)
    end
    
    #Retrieves a set of questions by their id(s)
    #
    #id can be an int, string, or an array of ints or strings
    #
    #Maps to '/questions/{id}'
    def retrieve_by_id(id, parameters = {})
      id = convert_if_array(id)
      
      Questions.new request('questions/' + id.to_s, parameters )
    end
    
    #Retrieves a set of questions by their tag(s)
    #
    #tag can be a string or an array of strings, tag(s) should be URL Encoded
    #
    #Maps to '/questions/tagged/{tags}
    def retrieve_by_tag(tags, parameters = {})
      tags = convert_if_array(tags)
      
      Questions.new request('questions/tagged/' + tags.to_s, parameters )
    end
    
    #Retieves a set of unanswered questions using the parameters provided
    #
    #Maps to '/questions/unanswered'
    def retrieve_unanswered(parameters = {})
      Questions.new request('questions/unanswered', parameters)
    end
    
    #Retrieves a set of favorite questions for user(s) by the users' id(s)
    #
    #user_id can be an int, string, or an array of ints or strings
    #
    #Maps to '/users/{id}/favorites
    def retrieve_favorites(user_id, parameters = {})
      user_id = convert_if_array(user_id)
      
      Questions.new request('users/'+user_id.to_s+'/favorites', parameters)
    end
    
    #Retrieve question summary for user(s) by their id(s)
    #
    #id can be an int, string, or an array of ints or strings
    #
    #Maps to '/users/{id}/questions'
    def retrieve_by_user(id, parameters = {})
      id = convert_if_array(id)
      
      Questions.new request('users/'+id.to_s+'/questions')
    end
    
  end
  
  private
  @dash
end

class QuestionsDash < PagedDash
  property :questions
end