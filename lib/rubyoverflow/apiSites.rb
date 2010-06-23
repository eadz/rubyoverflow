module Rubyoverflow
  class ApiSites < Base
    attr_reader :api_sites
    def initialize(hash, url = '')
      mash = ApiSitesDash.new hash
      @api_sites = Array.new
    
      mash.api_sites.each{|siteHash| @api_sites.push(ApiSite.new siteHash)}
    end
  
    class << self
      def retrieve_sites()
        client = Client.stackauth_client(Base.client.api_key)
      
        hash,url = client.request('sites',{})
      
        ApiSites.new hash,url
      end
    end
  end

  class ApiSitesDash < Hashie::Dash
    property :api_sites
  end
end