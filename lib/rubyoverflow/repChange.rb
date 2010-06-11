class RepChange
  attr_reader :user_id
  attr_reader :post_id
  attr_reader :post_type
  attr_reader :title
  attr_reader :positive_rep
  attr_reader :negative_rep
  attr_reader :on_date
  
  def initialize(hash)
    dash = RepChangeDash.new hash
    
    @user_id = dash.user_id
    @post_id = dash.post_id
    @post_type = dash.post_type
    @title = dash.title
    @positive_rep = dash.positive_rep
    @negative_rep = dash.negative_rep
    @on_date = dash.on_date
  end
  
end

class RepChangeDash <Hashie::Dash
  property :user_id
  property :post_id
  property :post_type
  property :title
  property :positive_rep
  property :negative_rep
  property :on_date
end