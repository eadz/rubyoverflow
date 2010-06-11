class Users < PagedBase
  
  attr_reader :users
  
  def initialize(hash)
    dash = UsersDash.new hash
    
    @users = Array.new
    
    dash.users.each{|userHash| @users.push(User.new userHash)}
  end
  
  class << self
    
    #Retieves all users using the parameters provided
    def retrieve_all(parameters = {})
      Users.new request('users/', parameters)
    end
    
    #Retrieves users by id(s) using the parameters provided
    #
    #id can be an int, string, or an array of either
    #
    #Maps to '/users/{id}'
    def retrieve_by_id(id, parameters = {})
      id = convert_if_array(id)
      
      Users.new request('users/'+id.to_s, parameters)
    end
    
    #Retrieves users that have received badge(s) by badge id(s) using the parameters provided
    #
    #id can be an int, string, or an array of either
    #
    #Maps to '/badges/{id}'
    def retrieve_by_badge(id, parameters = {})
      id = convert_if_array(id)
      
      Users.new request('badges/'+id.to_s, parameters)
    end
  end
  

end

class UsersDash < PagedDash
  property :users
end