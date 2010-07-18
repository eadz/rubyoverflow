require 'helper'

class TestBadge < Test::Unit::TestCase
  describe Badge do
    before(:all) do
      @badge = Badges.retrieve_all.badges.first
      set_api_key
    end
    
    it 'check badge' do
      check_badge @badge
    end
    
    it 'get_recipients' do
      check_user_set @badge.get_recipients(single_item_set)
    end
  end
end