module Rubyoverflow
  class ApiSite
    attr_reader :name, :logo_url, :api_endpoint, :site_url, :description, :icon_url, :state, :styling
  
    def initialize(hash,url='')
      dash = ApiSiteDash.new hash
    
      @name = dash.name
      @logo_url = dash.logo_url
      @api_endpoint = dash.api_endpoint
      @site_url = dash.site_url
      @description = dash.description
      @icon_url = dash.icon_url
      @state = dash.state
      @styling = Styling.new dash.styling if dash.styling
    end
  
  end

  class ApiSiteDash < Hashie::Dash
    property :name
    property :logo_url
    property :api_endpoint
    property :site_url
    property :description
    property :icon_url 
    property :state
    property :styling
  end
end