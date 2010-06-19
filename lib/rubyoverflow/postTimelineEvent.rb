module Rubyoverflow
  class PostTimelineEvent
    attr_reader :timeline_type
    attr_reader :post_id
    attr_reader :comment_id
    attr_reader :revision_guid
    attr_reader :creation_date
    attr_reader :user
    attr_reader :owner
    attr_reader :action
    attr_reader :post_revision_url
    attr_reader :post_url
    attr_reader :post_comment_url
  
    def initialize(hash, request_path = '')
      dash = PostTimelineEventDash.new hash
    
      @timeline_type = dash.timeline_type
      @post_id = dash.post_id
      @comment_id = dash.comment_id
      @revision_guid = dash.revision_guid
      @creation_date = dash.creation_date
      @user = User.new dash.user if dash.user
      @owner = User.new dash.owner if dash.owner
      @action = dash.action
      @post_revision_url = dash.post_revision_url
      @post_url = dash.post_url
      @post_comment_url = dash.post_comment_url
    end
    
    #Gets the question associated with this postTimelineEvent
    def get_post(parameters={})
      if @post_url
        hash,url = request(@post_url, parameters) 
        Questions.new hash, url #since, for now, you can only get a timeline from a question, we return a question set
      else
        nil
      end
    end
    
    #Gets the revision associated with this postTimelineEvent
    def get_post_revision(parameters={})
      if @post_revision_url
        hash,url = request(@post_revision_url, parameters) 
        Revisions.new hash, url
      else
        nil
      end
    end
    
    #Gets the comment associated with this postTimelineEvent
    def get_post_comment(parameters={})
      if @post_comment_url
        hash,url = request(@post_comment_url, parameters) 
        Comments.new hash, url
      else
        nil
      end
    end
  
  end

  class PostTimelineEventDash < Hashie::Dash
    property :timeline_type
    property :post_id
    property :comment_id
    property :revision_guid
    property :creation_date
    property :user
    property :owner
    property :action
    property :post_revision_url
    property :post_url
    property :post_comment_url
  end
end