class Badges < PagedBase
  
  attr_reader :badges
  
  def initialize(hash, request_path = '')
    dash = BadgesDash.new hash
    
    @badges = Array.new
    dash.badges.each{ |badgeHash| @badges.push(Badge.new badgeHash)}
    
    super(dash, request_path)
  end
  
  class <<self
    #Retrieves all badges in alphabetical order
    #
    #Maps to '/badges'
    def retrieve_all
      hash, url = request('badges')
      Badges.new hash, url
    end
    
    #Retrieves all standard, non-tag-based badges in alphabetical order
    #
    #Maps to '/badges/name'
    def retrieve_all_non_tag_based
      hash, url = request('badges/name')
      Badges.new hash, url
    end
    
    #Retrieves all tag-based badges in alphabetical order
    #
    #Maps to '/badges/tags'
    def retrieve_all_tag_based
      hash, url = request('badges/tags')
      Badges.new hash, url
    end
    
    #Retrieves all badges that have been awarded to a set of users by their id(s)
    #
    #id can be an int, string or an array of ints or strings
    #
    #Maps to '/users/{id}/badges'
    def retrieve_by_user(id)
      id = convert_if_array(id)
      
      hash, url = request('users/'+id.to_s+'/badges')
      Badges.new hash, url
    end
    
  end
  
end

class BadgesDash < PagedDash
  property :badges
end