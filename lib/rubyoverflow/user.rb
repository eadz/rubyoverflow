module Rubyoverflow
  class User < Base
  
    attr_reader :user_id
    attr_reader :user_type
    attr_reader :creation_date
    attr_reader :display_name
    attr_reader :reputation
    attr_reader :email_hash
    attr_reader :age
    attr_reader :last_access_date
    attr_reader :website_url
    attr_reader :location
    attr_reader :about_me
    attr_reader :question_count
    attr_reader :answer_count
    attr_reader :view_count
    attr_reader :up_vote_count
    attr_reader :down_vote_count
    attr_reader :accept_rate
    attr_reader :user_questions_url
    attr_reader :user_answers_url
    attr_reader :user_favorites_url
    attr_reader :user_tags_url
    attr_reader :user_badges_url
    attr_reader :user_timeline_url
    attr_reader :user_mentioned_url
    attr_reader :user_comments_url
    attr_reader :user_reputation_url
    attr_reader :badge_counts
    attr_reader :timed_penalty_date
    attr_reader :association_id
  
    def initialize(hash, request_path = '')
      dash = UserDash.new hash
    
      @user_id = dash.user_id
      @user_type = dash.user_type
      @creation_date = dash.creation_date
      @display_name = dash.display_name
      @reputation = dash.reputation
      @email_hash = dash.email_hash
      @age = dash.age
      @last_access_date = dash.last_access_date
      @website_url = dash.website_url
      @location = dash.location
      @about_me = dash.about_me
      @question_count = dash.question_count
      @answer_count = dash.answer_count
      @view_count = dash.view_count
      @up_vote_count = dash.up_vote_count
      @down_vote_count = dash.down_vote_count
      @accept_rate = dash.accept_rate
      @user_questions_url = dash.user_questions_url
      @user_answers_url = dash.user_answers_url
      @user_favorites_url = dash.user_favorites_url
      @user_tags_url = dash.user_tags_url
      @user_badges_url = dash.user_badges_url
      @user_timeline_url = dash.user_timeline_url
      @user_mentioned_url = dash.user_mentioned_url
      @user_comments_url = dash.user_comments_url
      @user_reputation_url = dash.user_reputation_url
      @badge_counts = BadgeCounts.new dash.badge_counts if dash.badge_counts
      @timed_penalty_date = dash.timed_penalty_date
      @association_id = dash.association_id
    end
  
    #Gets the questions by the user
    def get_questions(parameters = {})
      if @user_questions_url
        hash,url =request(@user_questions_url, parameters)
        Questions.new hash, url
      else
        nil
      end
    end
    
    #Gets the answers from the user
    def get_answers(parameters = {})
      if @user_answers_url
        hash,url =request(@user_answers_url, parameters)
        Answers.new hash, url
      else
        nil
      end
    end
    
    #Gets the questions favorited by the user
    def get_favorites(parameters = {})
      if @user_favorites_url
        hash,url =request(@user_favorites_url, parameters)
        Questions.new hash, url
      else
        nil
      end
    end
    
    #Gets the tags the user has participated in
    def get_tags(parameters = {})
      if @user_tags_url
        hash,url =request(@user_tags_url, parameters)
        Tags.new hash, url
      else
        nil
      end
    end
    
    #Gets the badges awared to the user
    def get_badges(parameters = {})
      if @user_badges_url
        hash,url =request(@user_badges_url, parameters)
        Badges.new hash, url
      else
        nil
      end
    end
    
    #Gets the user's timeline
    def get_timeline(parameters = {})
      if @user_timeline_url
        hash,url =request(@user_timeline_url, parameters)
        UserTimelineEvents.new hash, url
      else
        nil
      end
    end
    
    #Gets the comments that mention the user
    def get_mentioned(parameters = {})
      if @user_mentioned_url
        hash,url =request(@user_mentioned_url, parameters)
        Comments.new hash, url
      else
        nil
      end
    end
    
    #Gets the comments by the user
    def get_comments(parameters = {})
      if @user_comments_url
        hash,url =request(@user_comments_url, parameters)
        Comments.new hash, url
      else
        nil
      end
    end
    
    #Gets the user's reputation
    def get_reputation(parameters = {})
      if @user_reputation_url
        hash,url =request(@user_reputation_url, parameters)
        RepChanges.new hash, url
      else
        nil
      end
    end
  
  end

  class UserDash < Hashie::Dash
    property :user_id
    property :user_type
    property :creation_date
    property :display_name
    property :reputation
    property :email_hash
    property :age
    property :last_access_date
    property :website_url
    property :location
    property :about_me
    property :question_count
    property :answer_count
    property :view_count
    property :up_vote_count
    property :down_vote_count
    property :accept_rate
    property :user_questions_url
    property :user_answers_url
    property :user_favorites_url
    property :user_tags_url
    property :user_badges_url
    property :user_timeline_url
    property :user_mentioned_url
    property :user_comments_url
    property :user_reputation_url
    property :badge_counts
    property :timed_penalty_date
    property :association_id
  end
end