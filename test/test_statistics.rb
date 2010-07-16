require 'helper'

class TestStatistics < Test::Unit::TestCase
  describe "Statistics" do
    
    it "retrieve stats" do
      stats = Statistics.retrieve
      stats.should respond_to(:total_badges)
      stats.should respond_to(:total_unanswered)
      stats.should respond_to(:total_votes)
      stats.should respond_to(:total_comments)
      stats.should respond_to(:total_answers)
      stats.should respond_to(:site)
      stats.should respond_to(:total_users)
      stats.should respond_to(:questions_per_minute)
      stats.should respond_to(:answers_per_minute)
      stats.should respond_to(:badges_per_minute)
      stats.should respond_to(:views_per_day)
      stats.should respond_to(:api_version)
      stats.should respond_to(:total_accepted)
    end
    
  end
end
