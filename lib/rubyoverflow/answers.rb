class Answers < PagedBase
  attr_reader :answers
  
  def initialize(hash)
    @dash = AnswersDash.new hash
    
    @answers = Array.new
    @dash.answers.each {|answerHash| @answers.push(Answer.new answerHash)}
    
    super(@dash)
  end
  
  class << self
    def retrieve_by_id(id, options = {})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Answers.new request('answers/'+id.to_s, options)
    end
    
    def retrieve_by_user(id, options={})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Answers.new request('users/'+id.to_s+"/answers", options)
    end
    
    def retrieve_by_question(id, options={})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Answers.new request('questions/'+id.to_s+"/answers", options)
    end
  end
  
  private
  @dash
  
end

class AnswersDash < PagedDash
  property :answers
end