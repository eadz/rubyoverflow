require 'helper'

class TestBadges < Test::Unit::TestCase
  describe Badges do
    before(:all) do
      @users = Users.retrieve_all
      set_api_key
    end
    
    it 'retrieve_all' do
      badges = Badges.retrieve_all
      check_badge_set badges
    end
    
    it 'retrieve_all_non_tag_based' do
      badges = Badges.retrieve_all_non_tag_based
      check_badge_set badges
    end
    
    it 'retrieve_all_tag_based' do
      badges = Badges.retrieve_all_tag_based
      check_badge_set badges
    end
    
    it 'retrieve_by_user id' do
      badges = Badges.retrieve_by_user @users.users.first.user_id
      check_badge_set badges
    end
    
    it 'retrieve_by_user user' do
      badges = Badges.retrieve_by_user @users.users.first
      check_badge_set badges
    end
    
    it 'retrieve_by_user users' do
      badges = Badges.retrieve_by_user @users.users[0..5]
      check_badge_set badges
    end
  end
end