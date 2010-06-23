module Rubyoverflow
  class ApiSite
    attr_reader :name
    attr_reader :logo_url
    attr_reader :api_endpoint
    attr_reader :site_url
    attr_reader :description
    attr_reader :icon_url
  
    def initialize(hash,url='')
      dash = ApiSiteDash.new hash
    
      @name = dash.name
      @logo_url = dash.logo_url
      @api_endpoint = dash.api_endpoint
      @site_url = dash.site_url
      @description = dash.description
      @icon_url = dash.icon_url
    end
  
  end

  class ApiSiteDash < Hashie::Dash
    property :name
    property :logo_url
    property :api_endpoint
    property :site_url
    property :description
    property :icon_url 
  end
end