require 'helper'

class TestAnswers < Test::Unit::TestCase
  describe Answers do
    before(:all) do
      set_api_key
    end
    
    it "retrieve_by_id" do
      answers = Answers.retrieve_by_id 952594, single_item_set
      check_answer_set answers
    end
    
    it "retrieve_by_user" do
      answers = Answers.retrieve_by_user 53587, single_item_set
      check_answer_set answers
    end
    
    it "retrieve_by_question" do
      answers = Answers.retrieve_by_question 1104543, single_item_set
      check_answer_set answers
    end
    
    it "get_next_set" do
      answers = Answers.retrieve_by_question 1104543, single_item_set
      answers = answers.get_next_set
      check_answer_set answers
      answers.page.should == 2
    end
    
  end
end