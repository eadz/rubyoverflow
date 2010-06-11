class Comments < PagedBase
  
  attr_reader :comments
  
  def initialize(hash)
    dash = CommentsDash.new hash
    
    @comments = Array.new
    dash.comments.each{ |commentHash| @comments.push(Comment.new commentHash)}
    
    super(dash)
  end
  
  class << self
    def retrieve_by_id(id, parameters = {})
      id = convert_if_array(id)
      
      Comments.new request('comments/'+id.to_s, parameters)
    end
    
    def retrieve_by_user(id, parameters={})
      id = convert_if_array(id)
      
      Comments.new request('users/'+id.to_s+"/comments", parameters)
    end
    
    def retrieve_by_answer(id, parameters={})
      id = convert_if_array(id)
      
      Comments.new request('answers/'+id.to_s+"/comments", parameters)
    end
    
    def retrieve_by_post(id, parameters={})
      id = convert_if_array(id)
      
      Comments.new request('posts/'+id.to_s+"/comments", parameters)
    end
    
    def retrieve_by_question(id, parameters={})
      id = convert_if_array(id)
      
      Comments.new request('questions/'+id.to_s+"/comments", parameters)
    end
    
    def retrieve_from_user_to_user(id, toid, parameters={})
      id = convert_if_array(id)
      
      Comments.new request('users/'+id.to_s+"/comments/" + toid.to_s, parameters)
    end
    
    def retrieve_to_user(id, parameters={})
      id = convert_if_array(id)
      
      Comments.new request('users/'+id.to_s+"/mentioned", parameters)
    end
  end
  
end

class CommentsDash < PagedDash
  property :comments
end