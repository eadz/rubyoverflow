class Revisions < PagedBase
  attr_reader :revisions
  
  def initialize(hash, request_path = '')
    dash = RevisionsDash.new hash
    super(dash, request_path)
    
    @revisions = Array.new
    dash.revisions.each{|revisionHash| @revisions.push(Revision.new revisionHash)}
  end
  
  class << self
    
    #Retrieves the post history of a set of post(s) by their id(s)
    #
    #id can be an int, string or an array of ints or strings
    #
    #Maps to 'revisions/{id}'
    def retrieve_by_post(id, parameters = {})
      id = convert_if_array(id)
      hash, url = request('/revisions/'+id.to_s, parameters)
      Revisions.new hash, url
    end
    
    #Retrieves a specific post revision by post id and revision guid
    #
    #id can be an int, string or an array of ints or strings
    #
    #revisionguid must be a string in 8-4-4-4-12 format
    #
    #Maps to 'revisions/{id}'
    def retrieve_post_revision(id, revisionguid, parameters = {})
      id = convert_if_array(id)
      hash, url = request('/revisions/'+id.to_s + '/' + revisionguid, parameters)
      Revisions.new hash, url
    end
    
  end
  
end

class RevisionsDash < PagedDash
  property :revisions
end