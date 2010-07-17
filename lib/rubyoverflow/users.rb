module Rubyoverflow
  class Users < PagedBase
    attr_reader :users
  
    def initialize(hash, request_path = '')
      dash = UsersDash.new hash
      super(dash, request_path)
      @users = Array.new
    
      dash.users.each{|userHash| @users.push(User.new userHash)} if dash.users
      dash.associated_users.each{|userHash| @users.push(User.new userHash)} if dash.associated_users
      
    end
    
    #Retrieves the next set of users using the same parameters used to retrieve the current set
    def get_next_set
      hash,url = perform_next_page_request
      Users.new hash,url
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
        id = convert_to_id_list(id)
        hash,url = request('users/'+id.to_s, parameters)
        Users.new hash, url
      end
    
      #Retrieves users that have received badge(s) by badge id(s) using the parameters provided
      #
      #id can be an int, string, badge or an array of any of the three
      #
      #Maps to '/badges/{id}'
      def retrieve_by_badge(id, parameters = {})
        id = convert_to_id_list(id)
        hash,url = request('badges/'+id.to_s, parameters)
        Users.new hash, url
      end
      
      #Retrieves moderators for the current site the parameters provided
      #
      #Maps to '/users/moderators'
      def retrieve_moderators(parameters = {})
        hash,url = request('users/moderators', parameters)
        Users.new hash, url
      end
      
      def retrieve_associated_accounts(guid)
        client = Client.stackauth_client(Base.client.api_key)
        hash,url = client.request('users/' + guid +'/associated',{})
        Users.new hash,url
      end
    end
  end

  class UsersDash < PagedDash
    property :users
    property :associated_users
  end
end