module Rubyoverflow
  class Question < Base
    attr_reader :tags, :answer_count, :answers, :accepted_answer_id, :favorite_count, :bounty_closes_date,
      :bounty_amount, :closed_date, :closed_reason, :question_timeline_url, :question_comments_url,
      :question_answers_url, :question_id, :locked_date, :owner, :creation_date, :last_edit_date,
      :last_activity_date, :up_vote_count, :down_vote_count, :view_count, :score, :community_owned,
      :title, :body, :comments, :migrated, :protected_date
  
    def initialize(hash, request_path = '')
      dash = QuestionDash.new hash
    
      @tags = Array.new
      @comments = Array.new
      @answers = Array.new
    
      dash.tags.each {|tag| @tags.push(tag)} if dash.tags
      dash.comments.each {|commentHash| @comment.push(Comment.new commentHash)} if dash.comments
      dash.answers.each {|answerHash| @comment.push(Answer.new answerHash)} if dash.answers
    
      @migrated = dash.migrated
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
      @owner = User.new dash.owner if dash.owner
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
      @protected_date = dash.protected_date
    end
    
    #Gets the comments made on the question
    def get_comments(parameters = {})
      if @question_comments_url
        hash,url =request(@question_comments_url, parameters)
        Comments.new hash, url
      else
        nil
      end
    end
    
    #Gets the answers posted to the question
    def get_answers(parameters = {})
      if @question_answers_url
        hash,url =request(@question_answers_url, parameters)
        Answers.new hash, url
      else
        nil
      end
    end
    
    #Gets the timeline for the question
    def get_timeline(parameters = {})
      if @question_timeline_url
        hash,url =request(@question_timeline_url, parameters)
        PostTimelineEvents.new hash, url
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
    property :migrated
    property :protected_date
  end
end