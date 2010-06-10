class Answers < PagedBase
  attr_reader :answers
  
  def initialize(hash)
    @dash = AnswersDash.new hash
    
    @answers = Array.new
    @dash.answers.each {|answerHash| @answers.push(Answer.new answerHash)}
    
    super(@dash)
  end
  
  class << self
    def retrieve_by_id(id, parameters = {})
      id = convert_if_array(id)
      
      Answers.new request('answers/'+id.to_s, parameters)
    end
    
    def retrieve_by_user(id, parameters={})
      id = convert_if_array(id)
      
      Answers.new request('users/'+id.to_s+"/answers", parameters)
    end
    
    def retrieve_by_question(id, parameters={})
      id = convert_if_array(id)
      
      Answers.new request('questions/'+id.to_s+"/answers", parameters)
    end
  end
  
  private
  @dash
  
end

class AnswersDash < PagedDash
  property :answers
end