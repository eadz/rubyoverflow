class Badges < PagedBase
  
  attr_reader :badges
  
  def initialize(hash)
    @dash = BadgesDash.new hash
    
    @badges = Array.new
    @dash.badges.each{ |badgeHash| @badges.push(Badge.new badgeHash)}
    
    super(@dash)
  end
  
  class <<self
    #Retrieves all badges in alphabetical order
    #
    #Maps to '/badges'
    def retrieve_all
      Badges.new request('badges')
    end
    
    #Retrieves all standard, non-tag-based badges in alphabetical order
    #
    #Maps to '/badges/name'
    def retrieve_all_non_tag_based
      Badges.new request('badges/name')
    end
    
    #Retrieves all tag-based badges in alphabetical order
    #
    #Maps to '/badges/tags'
    def retrieve_all_tag_based
      Badges.new request('badges/tags')
    end
    
    #Retrieves all badges that have been awarded to a set of users by their id(s)
    #
    #id can be an int, string or an array of ints or strings
    #
    #Maps to '/users/{id}/badges'
    def retrieve_by_user(id)
      id = convert_if_array(id)
      
      Badges.new request('users/'+id.to_s+'/badges')
    end
    
  end
  
  private
  @dash
end

class BadgesDash < PagedDash
  property :badges
end