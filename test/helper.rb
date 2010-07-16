require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'spec'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rubyoverflow'
include Rubyoverflow

class Test::Unit::TestCase
end

def check_paged_class(paged_class)
  paged_class.should respond_to(:total)
  paged_class.should respond_to(:pagesize)
  paged_class.should respond_to(:page)
  paged_class.should respond_to(:request_path)
  paged_class.should respond_to(:query_parameters)
end

