require 'helper'

class TestUser < Test::Unit::TestCase
  describe User do
    before(:all) do
      @user = Users.retrieve_by_id(53587, single_item_set).users.first
      set_api_key
    end
    
    it 'check user' do
      check_user @user
    end
    
    it 'get_questions' do
      check_question_set @user.get_questions(single_item_set)
    end

    it 'get_answers' do
      check_answer_set @user.get_answers(single_item_set)
    end

    it 'get_favorites' do
      check_question_set @user.get_favorites(single_item_set)
    end

    it 'get_tags' do
      check_tag_set @user.get_tags(single_item_set)
    end
    
    it 'get_badges' do
      check_badge_set @user.get_badges
    end
    
    it 'get_timeline' do
       check_user_timeline_event_set @user.get_timeline(single_item_set)
    end
    
    it 'get_mentioned' do
      check_comment_set @user.get_mentioned(single_item_set)
    end
    
    it 'get_comments' do
      check_comment_set @user.get_comments(single_item_set)
    end
    
    it 'get_reputation' do
      check_rep_change_set @user.get_reputation(single_item_set)
    end
    
    it 'retrieve_associated_accounts' do
      users = @user.retrieve_associated_accounts
      users.should respond_to(:users)
      check_user users.users.first
    end
  end
end