module Rubyoverflow
  class Comment
  
    attr_reader :comment_id
    attr_reader :creation_date
    attr_reader :owner
    attr_reader :reply_to_user
    attr_reader :post_id
    attr_reader :post_type
    attr_reader :score
    attr_reader :edit_count
    attr_reader :body
  
    def initialize(hash, request_path = '')
      dash = CommentDash.new hash
    
      @comment_id = dash.comment_id
      @creation_date = dash.creation_date
      @owner = User.new dash.owner
      @reply_to_user = User.new dash.reply_to_user if dash.reply_to_user
      @post_id = dash.post_id
      @post_type = dash.post_type
      @score = dash.score
      @edit_count = dash.edit_count
      @body = dash.body
    end
  
  end

  class CommentDash < Hashie::Dash
    property :comment_id
    property :creation_date
    property :owner
    property :reply_to_user
    property :post_id
    property :post_type
    property :score
    property :edit_count
    property :body
  end
end