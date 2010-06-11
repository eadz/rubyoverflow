class RepChanges < PagedBase
  
  attr_reader :rep_changes
  
  def initialize(hash)
    dash = RepChangesDash.new hash
    super(dash)
    
    @rep_changes = Array.new
    dash.rep_changes.each{|repHash| @rep_changes.push(RepChange.new repHash)}
  end
  
  class << self
    
    #Retrieves all the rep_changes for a set of user(s) by their id(s)
    #
    #id can be an int, string, or an array of ints or strings
    #
    #Maps to '/users{id}/reputation'
    def retrieve_by_user(id, parameters={})
      id = convert_if_array(id)
      
      RepChanges.new request('/users/' + id.to_s + '/reputation', parameters)
    end
    
  end
  
end

class RepChangesDash < PagedDash
  property :rep_changes
  
end