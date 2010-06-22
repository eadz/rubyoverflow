class ApiSites
  attr_reader :api_sites
  def initialize(hash, url = '')
    mash = Hashie::Mash.new hash
    @api_sites = Array.new
    
    mash.api_sites.each{|siteHash| @api_sites.push(ApiSite.new siteHash)}
  end
  
  class << self
    def retrieve_sites(api_key='')
      client = Client.stackauth_client(api_key)
      
      hash,url = client.request('sites',{})
      
      ApiSites.new hash,url
    end
  end
end