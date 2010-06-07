class Badges < PagedBase
  
  attr_reader :badges
  
  def initialize(hash)
    @dash = BadgesDash.new hash
    
    @badges = Array.new
    @dash.badges.each{ |badgeHash| @badges.push(Tag.new badgeHash)}
    
    super(@dash)
  end
  
  private
  @dash
end

class BadgesDash < PagedDash
  property :badges
end