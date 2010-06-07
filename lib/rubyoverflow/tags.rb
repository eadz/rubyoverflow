class Tags <Base
  
  def total
    @dash.total
  end
  
  def pagesize
    @dash.pagesize
  end
  
  def page
    @dash.page
  end
  
  def tags
    @tags
  end
  
  def initialize(hash)
    @dash = TagsDash.new hash
    @tags = Array.new
    @dash.tags.each{ |tagHash| @tags.push(Tag.new tagHash)}
  end
  
  class << self
    def retrieve(options = {})
      Tags.new request('tags', options)
    end
    
    def retrieve_by_user(id, options = {})
      Tags.new request('users/'+id.to_s+'/tags',options)
    end
  end
  
  private
  @dash
  @tags
end

class TagsDash <Hashie::Dash
  property :total
  property :tags
  property :pagesize
  property :page
end
