require 'helper'

class TestUsers < Test::Unit::TestCase
  describe Users do
    before(:all) do
      @badges = Badges.retrieve_all
      set_api_key
    end
    
    it 'retrieves_all_users' do
      users = Users.retrieve_all single_item_set
      check_user_set users
    end
    
    it 'get_next_set' do
      users = Users.retrieve_all single_item_set
      users = users.get_next_set
      check_user_set users
      users.page.should == 2
    end
    
    it 'retrieves by id' do
      users = Users.retrieve_by_id 53587, single_item_set
      check_user_set users
    end
    
    it 'retrieve_by_badge' do
      users = Users.retrieve_by_badge @badges.badges.first.badge_id, single_item_set
      check_user_set users
    end
    
    it 'retrieve_moderators' do
      users = Users.retrieve_moderators single_item_set
      check_user_set users
    end
  end
end
