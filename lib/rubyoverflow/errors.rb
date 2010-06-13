module Rubyoverflow
  class Errors < Base
  
    class << self
    
      #Retrieves errors
      #
      #Maps to 'errors/{id}'
      def retrieve(id)
        request('errors/'+id.to_s)
      end
    
    end
  
  
  end
end