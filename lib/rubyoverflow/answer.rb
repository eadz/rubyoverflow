class Answer
  attr_reader :answer_id
  attr_reader :accepted
  attr_reader :answer_comments_url
  attr_reader :question_id
  attr_reader :locked_date
  attr_reader :owner
  attr_reader :creation_date
  attr_reader :last_edit_date
  attr_reader :last_activity_date
  attr_reader :up_vote_count
  attr_reader :down_vote_count
  attr_reader :view_count
  attr_reader :score
  attr_reader :community_owned
  attr_reader :title
  attr_reader :body
  attr_reader :comments
  
  def initialize(hash)
    @dash = AnswerDash.new hash
    
    @answer_id = @dash.answer_id
    @accepted = @dash.accepted
    @answer_comments_url = @dash.answer_comments_url
    @question_id = @dash.question_id
    @locked_date = @dash.locked_date
    @owner = User.new @dash.owner 
    @creation_date = @dash.creation_date
    @last_edit_date = @dash.last_edit_date
    @last_activity_date = @dash.last_activity_date
    @up_vote_count = @dash.up_vote_count
    @down_vote_count = @dash.down_vote_count
    @view_count = @dash.view_count
    @score = @dash.score
    @community_owned = @dash.community_owned
    @title = @dash.title
    @body = @dash.body
    @comments = Comments.new @dash.comments if @dash.comments
  end
  
  private
  @dash
end

class AnswerDash < Hashie::Dash
  
  property :answer_id
  property :accepted
  property :answer_comments_url
  property :question_id
  property :locked_date
  property :owner
  property :creation_date
  property :last_edit_date
  property :last_activity_date
  property :up_vote_count
  property :down_vote_count
  property :view_count
  property :score
  property :community_owned
  property :title
  property :body
  property :comments
end