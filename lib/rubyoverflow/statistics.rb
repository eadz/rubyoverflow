module Rubyoverflow
  class Statistics < Base
  
    attr_reader :total_questions, :total_badges, :total_unanswered, :total_votes, :total_comments, :total_answers, :site,
      :total_users, :questions_per_minute, :answers_per_minute, :badges_per_minute, :views_per_day, :api_version, :total_accepted

    def initialize(hash, request_path = '')
      dash = StatisticsDash.new hash
    
      @total_questions = dash.total_questions
      @total_accepted = dash.total_accepted
      @total_badges = dash.total_badges
      @total_unanswered = dash.total_unanswered
      @total_votes = dash.total_votes
      @total_comments = dash.total_comments
      @total_answers = dash.total_answers
      @total_users = dash.total_users
      @questions_per_minute = dash.questions_per_minute
      @answers_per_minute = dash.answers_per_minute
      @badges_per_minute = dash.badges_per_minute
      @views_per_day = dash.views_per_day
      @site = ApiSite.new dash.site
      @api_version = ApiVersion.new dash.api_version
    end

  
    class << self
    
      #Retrieves the stats for the domain
      #
      #Maps to 'stats'
      def retrieve
        hash, url = request('stats')
        Statistics.new hash['statistics'].first, url
      end
    end

  
  end

  class StatisticsDash < Hashie::Dash
    property :total_questions
    property :total_badges
    property :total_unanswered
    property :total_votes
    property :total_comments
    property :total_answers
    property :total_users
    property :total_accepted
    property :questions_per_minute
    property :answers_per_minute
    property :badges_per_minute
    property :views_per_day
    property :api_version
    property :site
  end
end