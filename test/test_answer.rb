require 'helper'

class TestAnswer < Test::Unit::TestCase
  describe Answer do
    before(:all) do
      #@user = Users.retrieve_by_id(53587, single_item_set).users.first
      @answer = Answers.retrieve_by_id(952594, single_item_set).answers.first
      set_api_key
    end
    
    it "check answer" do
      check_answer @answer
    end
    
    it "get_comments" do
      check_comment_set @answer.get_comments single_item_set
    end
    
  end
end