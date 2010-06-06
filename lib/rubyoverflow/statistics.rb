class Statistics < Base
  
  def total_questions
    @dash.total_questions
  end
  def total_badges
    @dash.total_badges
  end
  def total_unanswered
    @dash.total_unanswered
  end
  def total_votes
    @dash.total_votes
  end
  def total_comments
    @dash.total_comments
  end
  def total_answers
    @dash.total_answers
  end
  def total_users
    @dash.total_users
  end
  def questions_per_minute
    @dash.questions_per_minute
  end
  def answers_per_minute
    @dash.answers_per_minute
  end
  def badges_per_minute
    @dash.badges_per_minute
  end
  def display_name
    @dash.total_users
  end
  def api_version
    ApiVersion.new @dash.api_version
  end

  def initialize(hash)
    @dash = StatisticsDash.new hash
  end

  
  class << self
    def retrieve
      Statistics.new request('stats')['statistics'].first
    end
  end
  private
  @dash
  
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