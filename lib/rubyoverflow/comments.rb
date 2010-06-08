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
  end
  
  private
  @dash
  
end

class CommentsDash < PagedDash
  property :comments
end