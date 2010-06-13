class Statistics < Base
  
  attr_reader :total_questions
  attr_reader :total_badges
  attr_reader :total_unanswered
  attr_reader :total_votes
  attr_reader :total_comments
  attr_reader :total_answers
  attr_reader :total_users
  attr_reader :questions_per_minute
  attr_reader :answers_per_minute
  attr_reader :badges_per_minute
  attr_reader :display_name
  attr_reader :api_version

  def initialize(hash, request_path = '')
    dash = StatisticsDash.new hash
    
    @total_questions = dash.total_questions
    @total_badges = dash.total_badges
    @total_unanswered = dash.total_unanswered
    @total_votes = dash.total_votes
    @total_comments = dash.total_comments
    @total_answers = dash.total_answers
    @total_users = dash.total_users
    @questions_per_minute = dash.questions_per_minute
    @answers_per_minute = dash.answers_per_minute
    @badges_per_minute = dash.badges_per_minute
    @display_name = dash.display_name
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
  property :questions_per_minute
  property :answers_per_minute
  property :badges_per_minute
  property :display_name
  property :api_version
end