module Rubyoverflow
  class Tags < PagedBase
  
    attr_reader :tags
  
    def initialize(hash, request_path = '')
      dash = TagsDash.new hash
      @tags = Array.new
      dash.tags.each{ |tagHash| @tags.push(Tag.new tagHash)}
    
      super(dash, request_path)
    end
    
    #Retrieves the next set of tags using the same parameters used to retrieve the current set
    def get_next_set
      hash,url = perform_next_page_request
      Tags.new hash,url
    end
  
    class << self
      #Retrieves all of the tags
      #
      #Maps to '/tags/
      def retrieve_all(parameters = {})
        hash, url = request('tags', parameters)
        Tags.new hash, url
      end
    
      #Retieves all of the tags assign to a set of users by their ids
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to 'users/{id}/tags'
      def retrieve_by_user(id, parameters = {})
        id = convert_to_id_list(id)
        hash, url = request('users/'+id.to_s+'/tags',parameters)
        Tags.new hash, url
      end
    end
  end

  class TagsDash < PagedDash
    property :tags
  
  end
end