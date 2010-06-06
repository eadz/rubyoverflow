path = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)

require 'rubygems'

require 'open-uri'
require 'zlib'
require 'json'
require 'hashie'
require 'ostruct'
require 'rubyoverflow/base'
require 'rubyoverflow/statistics'
require 'rubyoverflow/apiVersion'
require 'rubyoverflow/tags'
require 'rubyoverflow/tag'

module Rubyoverflow
  class Client
    HOST = 'http://api.stackoverflow.com'
    VERSION = '0.8'

    attr_reader :host
    
    def initialize(options = OpenStruct.new)
      @host = options.host || HOST
      @version = options.version || VERSION
      @api_key = options.api_key
    end
    
    def get(url) 
      stream = open(url) { |stream| Zlib::GzipReader.new(stream).read }
      JSON.parse(stream)
    end
    
    def request(path, options)
      options.merge! :key => @api_key if @api_key
      puts query_string(options)
      get (host_path + normalize(path)) + query_string(options)
    end
    
    def host_path
      normalize(@host) +  normalize(@version)
    end
    
    class << self
      def config &block
        options = OpenStruct.new
        yield options if block_given?
        init_client! Client.new(options)
      end
      
      def init_client!(client)
        base_eigenclass = class << Base; self; end
        base_eigenclass.send :define_method, :client do
          @client = client
        end
        client
      end
    end

    private
    def normalize(path)
      path.end_with?('/') ? path : path+ '/'
    end
    
    def query_string(options)
     params = options.sort_by { |k, v| k.to_s }
     pairs  = params.map { |key, value| "#{key}=#{value}" }

     '?' + pairs.join('&')
   end
  end
end