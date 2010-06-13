module Rubyoverflow
  class Users < PagedBase
  
    attr_reader :users
  
    def initialize(hash, request_path = '')
      dash = UsersDash.new hash
      super(dash, request_path)
      @users = Array.new
    
      dash.users.each{|userHash| @users.push(User.new userHash)}
    end
  
    class << self
    
      #Retieves all users using the parameters provided
      #
      #Maps to '/users'
      def retrieve_all(parameters = {})
        hash,url = request('users/', parameters)
        Users.new hash, url
      end
    
      #Retrieves users by id(s) using the parameters provided
      #
      #id can be an int, string, or an array of either
      #
      #Maps to '/users/{id}'
      def retrieve_by_id(id, parameters = {})
        id = convert_if_array(id)
        hash,url = request('users/'+id.to_s, parameters)
        Users.new hash, url
      end
    
      #Retrieves users that have received badge(s) by badge id(s) using the parameters provided
      #
      #id can be an int, string, or an array of either
      #
      #Maps to '/badges/{id}'
      def retrieve_by_badge(id, parameters = {})
        id = convert_if_array(id)
        hash,url = request('badges/'+id.to_s, parameters)
        Users.new hash, url
      end
    end
  

  end

  class UsersDash < PagedDash
    property :users
  end
end