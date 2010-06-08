class Badges < PagedBase
  
  attr_reader :badges
  
  def initialize(hash)
    @dash = BadgesDash.new hash
    
    @badges = Array.new
    @dash.badges.each{ |badgeHash| @badges.push(Badge.new badgeHash)}
    
    super(@dash)
  end
  
  class <<self
    def retrieve
      Badges.new request('badges')
    end
  end
  
  private
  @dash
end

class BadgesDash < PagedDash
  property :badges
end