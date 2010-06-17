module Rubyoverflow
  class RepChanges < PagedBase
  
    attr_reader :rep_changes
  
    def initialize(hash, request_path = '')
      dash = RepChangesDash.new hash
      super(dash, request_path)
    
      @rep_changes = Array.new
      dash.rep_changes.each{|repHash| @rep_changes.push(RepChange.new repHash)}
    end
    
    #Retrieves the next set of RepChanges using the same parameters used to retrieve the current set
    def get_next_set
      hash,url = perform_next_page_request
      RepChanges.new hash,url
    end
    
    class << self
    
      #Retrieves all the rep_changes for a set of user(s) by their id(s)
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to '/users{id}/reputation'
      def retrieve_by_user(id, parameters={})
        id = convert_if_array(id)
        hash, url = request('/users/' + id.to_s + '/reputation', parameters)
        RepChanges.new hash, url
      end
    
    end
  
  end

  class RepChangesDash < PagedDash
    property :rep_changes
  
  end
end