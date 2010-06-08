class Tags < PagedBase
  
  def tags
    @tags
  end
  
  def initialize(hash)
    @dash = TagsDash.new hash
    @tags = Array.new
    @dash.tags.each{ |tagHash| @tags.push(Tag.new tagHash)}
    
    super(@dash)
  end
  
  class << self
    def retrieve(options = {})
      Tags.new request('tags', options)
    end
    
    def retrieve_by_user(id, options = {})
      
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Tags.new request('users/'+id.to_s+'/tags',options)
    end
  end
  
  private
  @dash
  @tags
end

class TagsDash < PagedDash
  property :tags
  
end
