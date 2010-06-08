class Comments < PagedBase
  
  attr_reader :comments
  
  def initialize(hash)
    @dash = CommentsDash.new hash
    
    @comments = Array.new
    @dash.comments.each{ |commentHash| @comments.push(Comment.new commentHash)}
    
    super(@dash)
  end
  
  class << self
    def retrieve_by_id(id, options = {})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Comments.new request('comments/'+id.to_s, options)
    end
    
    def retrieve_by_user(id, options={})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Comments.new request('users/'+id.to_s+"/comments", options)
    end
    
    def retrieve_by_answer(id, options={})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Comments.new request('answers/'+id.to_s+"/comments", options)
    end
    
    def retrieve_by_post(id, options={})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Comments.new request('posts/'+id.to_s+"/comments", options)
    end
    
    def retrieve_by_question(id, options={})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Comments.new request('questions/'+id.to_s+"/comments", options)
    end
    
    def retrieve_from_user_to_user(id, toid, options={})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Comments.new request('users/'+id.to_s+"/comments/" + toid.to_s, options)
    end
    
    def retrieve_to_user(id, options={})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Comments.new request('users/'+id.to_s+"/mentioned", options)
    end
  end
  
  private
  @dash
  
end

class CommentsDash < PagedDash
  property :comments
end