class UserTimelineEvent
  attr_reader :user_id
  attr_reader :timeline_type
  attr_reader :post_id
  attr_reader :post_type
  attr_reader :comment_id
  attr_reader :action
  attr_reader :creation_date
  attr_reader :description
  attr_reader :detail
  
  def initialize(hash, request_path = '')
    dash = UserTimelineEventDash.new hash
    
    @user_id = dash.user_id
    @timeline_type = dash.timeline_type
    @post_id = dash.post_id
    @post_type = dash.post_type
    @comment_id = dash.comment_id
    @action = dash.action
    @creation_date = dash.creation_date
    @description = dash.description
    @detail = dash.detail
  end
  
  
end

class UserTimelineEventDash < Hashie::Dash

  property :user_id
  property :timeline_type
  property :post_id
  property :post_type
  property :comment_id
  property :action
  property :creation_date
  property :description
  property :detail
  
end