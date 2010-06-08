class Badges < PagedBase
  
  attr_reader :badges
  
  def initialize(hash)
    @dash = BadgesDash.new hash
    
    @badges = Array.new
    @dash.badges.each{ |badgeHash| @badges.push(Badge.new badgeHash)}
    
    super(@dash)
  end
  
  class <<self
    def retrieve_all
      Badges.new request('badges')
    end
    
    def retrieve_all_non_tag_based
      Badges.new request('badges/name')
    end
    
    def retrieve_all_tag_based
      Badges.new request('badges/tags')
    end
  end
  
  private
  @dash
end

class BadgesDash < PagedDash
  property :badges
end