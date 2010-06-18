module Rubyoverflow
  class Question
    attr_reader :tags
    attr_reader :answer_count
    attr_reader :answers
    attr_reader :accepted_answer_id
    attr_reader :favorite_count
    attr_reader :bounty_closes_date
    attr_reader :bounty_amount
    attr_reader :closed_date
    attr_reader :closed_reason
    attr_reader :question_timeline_url
    attr_reader :question_comments_url
    attr_reader :question_answers_url
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
  
    def initialize(hash, request_path = '')
      dash = QuestionDash.new hash
    
      @tags = Array.new
      @comments = Array.new
      @answers = Array.new
    
      dash.tags.each {|tag| @tags.push(tag)}
      dash.comments.each {|commentHash| @comment.push(Comment.new commentHash)}
      dash.answers.each {|answerHash| @comment.push(Answer.new answerHash)}
    
      @answer_count = dash.answer_count
      @accepted_answer_id = dash.accepted_answer_id
      @favorite_count = dash.favorite_count
      @bounty_closes_date = dash.bounty_closes_date
      @bounty_amount = dash.bounty_amount
      @closed_date = dash.closed_date
      @closed_reason = dash.closed_reason
      @question_timeline_url = dash.question_timeline_url
      @question_comments_url = dash.question_comments_url
      @question_answers_url = dash.question_answers_url
      @question_id = dash.question_id
      @locked_date = dash.locked_date
      @owner = User.new dash.owner
      @creation_date = dash.creation_date
      @last_edit_date = dash.last_edit_date
      @last_activity_date = dash.last_activity_date
      @up_vote_count = dash.up_vote_count
      @down_vote_count = dash.down_vote_count
      @view_count = dash.view_count
      @score = dash.score
      @community_owned = dash.community_owned
      @title = dash.title
      @body = dash.body
    end
    
    #Gets the comments made on the answer
    def get_comments(parameters = {})
      if @answer_comments_url
        hash,url =request(@answer_comments_url, parameters)
        Comments.new hash, url
      else
        nil
      end
    end
  

  end

  class QuestionDash < Hashie::Dash
    property :tags
    property :answer_count
    property :answers
    property :accepted_answer_id
    property :favorite_count
    property :bounty_closes_date
    property :bounty_amount
    property :closed_date
    property :closed_reason
    property :question_timeline_url
    property :question_comments_url
    property :question_answers_url
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
end