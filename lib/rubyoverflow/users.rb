class Users < PagedBase
  
  attr_reader :users
  
  def initialize(hash)
    @dash = UsersDash.new hash
    
    @users = Array.new
    
    @dash.users.each{|userHash| @users.push(User.new userHash)}
  end
  
  class << self
    def retrieve(options = {})
      Users.new request('users/', options)
    end
    
    def retrieve_by_id(id, options = {})
      if(id.kind_of?(Array))
        id=id.join(';')
      end
      
      Users.new request('users/'+id.to_s, options)
    end
    
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