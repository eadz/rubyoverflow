path = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)

require 'rubygems'

require 'open-uri'
require 'zlib'
require 'json'
require 'hashie'
require 'rubyoverflow/base'
require 'rubyoverflow/statistics'

class Rubyoverflow
  
end