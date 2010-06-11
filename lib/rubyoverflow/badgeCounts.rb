class BadgeCounts
  
  attr_reader :gold
  attr_reader :silver
  attr_reader :bronze
  
  def initialize(hash)
    dash = BadgeCountDash.new hash
    @gold = dash.gold
    @silver = dash.silver
    @bronze = dash.bronze
  end
  
end

class BadgeCountDash < Hashie::Dash
  property :gold
  property :silver
  property :bronze
end