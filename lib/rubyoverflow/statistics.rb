class Statistics < Base
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
  property :api_version
  property :display_name
  
  class << self
    def retrieve
      Statistics.new get('stats/')['statistics'].first
    end
  end
end