module Rubyoverflow
  class Base

    def request(path, parameters = {})
      Base.request(path, parameters)
    end
  
    def find_parse_querystring(rawurl)
      url, querystring = rawurl.split('?')
      queryHash = {}
      if querystring
        querystring.split('&').each {|pair|
          key,value=pair.split('=')
          queryHash[key]=value 
        }
        queryHash
      end
      url.sub!(Base.client.host_path,'')
      return url,queryHash
    end
    
    class << self
      def client 
        @client ||= Rubyoverflow::Client.config
      end
    
      def request(path, parameters = {})
        client.request(path, parameters)
      end
    
      def convert_if_array(id)
        if(id.kind_of?(Array))
          id=id.join(';')
        end
      
        id
      end
    end
    
  end
end