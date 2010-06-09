class Users < PagedBase
  
  attr_reader :users
  
  def initialize(hash)
    @dash = UsersDash.new hash
    
    @users = Array.new
    
    @dash.users.each{|userHash| @users.push(User.new userHash)}
  end
  
  class << self
    
    #Retieves all users
    def retrieve_all(options = {})
      Users.new request('users/', options)
    end
    
    #Retrieves users by id
    #
    #id can be an int, string, or an array of either
    #
    #Maps to '/users/{id}'
    def retrieve_by_id(id, options = {})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Users.new request('users/'+id.to_s, options)
    end
    
    #Retrieves users by badge id
    #
    #id can be an int, string, or an array of either
    #
    #Maps to '/badges/{id}'
    def retrieve_by_badge(id, options = {})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Users.new request('badges/'+id.to_s, options)
    end
  end
  
  private
  @dash
end

class UsersDash < PagedDash
  property :users
end