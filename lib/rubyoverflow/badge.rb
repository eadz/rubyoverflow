class Badge
  attr_reader :badge_id
  attr_reader :rank
  attr_reader :name
  attr_reader :description
  attr_reader :award_count
  attr_reader :tag_based
  attr_reader :user
  attr_reader :badges_recipients_url
  
  def initialize(hash)
    @dash = BadgeDash.new hash
    
    @badge_id = @dash.badge_id
    @rank = @dash.rank
    @name = @dash.name
    @description = @dash.description
    @award_count = @dash.award_count
    @tag_based = @dash.tag_based
    @user = User.new @dash.user if @dash.user
    @badges_recipients_url = @dash.badges_recipients_url
  end
  private
  @dash
end

class BadgeDash < Hashie::Dash
  property :badge_id
  property :rank
  property :name
  property :description
  property :award_count
  property :tag_based
  property :user
  property :badges_recipients_url
end