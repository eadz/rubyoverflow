class Base

  class << self
    def client 
      @client ||= Rubyoverflow::Client.config
    end
    
    def request(path, options = {})
      client.request(path, options)
    end
  end
end