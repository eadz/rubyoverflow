class Base

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