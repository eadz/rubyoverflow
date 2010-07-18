require 'helper'

class TestBase < Test::Unit::TestCase
  describe Base do
    
    it 'find_parse_querystring' do
      base = Base.new
      testVal = 'http://api.stackoverflow.com/1.0/users/?order=asc&page=2'
      url,queryHash = base.find_parse_querystring testVal
      url.should == 'users/'
      queryHash.should == {'order'=>'asc','page'=>'2'}
    end
    
    it 'convert_to_id_list int' do
      Base.convert_to_id_list(1).should == '1'
    end
    
    it 'convert_to_id_list string' do
      Base.convert_to_id_list('1').should == '1'
    end
    
    it 'convert_to_id_list item' do
      item = Item.new 1
      
      Base.convert_to_id_list(item).should == '1'
    end
    
    it 'convert_to_id_list int[]' do
      Base.convert_to_id_list([1,2,3]).should == '1;2;3'
    end
    
    it 'convert_to_id_list string[]' do
      Base.convert_to_id_list(['1','2','3']).should == '1;2;3'
    end
    
    it 'convert_to_id_list item[]' do
      item1 = Item.new 1
      item2 = Item.new 2
      item3 = Item.new 3
      
      Base.convert_to_id_list([item1,item2,item3]).should == '1;2;3'
    end
    
    it 'convert_to_id_list mixed[]' do
      item3 = Item.new 3
      Base.convert_to_id_list([1,'2',item3]).should == '1;2;3'
    end
    
  end
end

class Item
  attr_reader :val
  
  def initialize(id)
    @val = id
  end
  
  def item_id
    @val
  end
  
end