class Tags < PagedBase
  
  attr_reader :tags
  
  def initialize(hash)
    dash = TagsDash.new hash
    @tags = Array.new
    dash.tags.each{ |tagHash| @tags.push(Tag.new tagHash)}
    
    super(dash)
  end
  
  class << self
    def retrieve(parameters = {})
      Tags.new request('tags', parameters)
    end
    
    def retrieve_by_user(id, parameters = {})
      
      id = convert_if_array(id)
      
      Tags.new request('users/'+id.to_s+'/tags',parameters)
    end
  end
end

class TagsDash < PagedDash
  property :tags
  
end
