class Revision
  attr_reader :body
  attr_reader :comment
  attr_reader :creation_date
  attr_reader :is_question
  attr_reader :is_rollback
  attr_reader :last_body
  attr_reader :last_title
  attr_reader :last_tags
  attr_reader :revision_guid
  attr_reader :revision_number
  attr_reader :tags
  attr_reader :title
  attr_reader :revision_type
  attr_reader :set_community_wiki
  attr_reader :user
  attr_reader :post_id
  
  def initialize(hash, request_path = '')
    dash = RevisionDash.new hash
    
    @body = dash.body
    @comment = dash.comment
    @creation_date = dash.creation_date
    @is_question = dash.is_question
    @is_rollback = dash.is_rollback
    @last_body = dash.last_body
    @last_title = dash.last_title
    @last_tags = dash.last_tags
    @revision_guid = dash.revision_guid
    @revision_number = dash.revision_number
    @tags = dash.tags
    @title = dash.title
    @revision_type = dash.revision_type
    @set_community_wiki = dash.set_community_wiki
    @user = User.new dash.user if dash.user
    @post_id = dash.post_id
  end
  
  
end

class RevisionDash < Hashie::Dash
  property :body
  property :comment
  property :creation_date
  property :is_question
  property :is_rollback
  property :last_body
  property :last_title
  property :last_tags
  property :revision_guid
  property :revision_number
  property :tags
  property :title
  property :revision_type
  property :set_community_wiki
  property :user
  property :post_id 
end