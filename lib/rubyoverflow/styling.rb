module Rubyoverflow
  class Styling
    attr_reader :link_color, :tag_foreground_color ,:tag_background_color
    
    def initialize(hash)
      dash = StylingDash.new hash
      @link_color = dash.link_color
      @tag_background_color = dash.tag_background_color
      @tag_foreground_color = dash.tag_foreground_color
    end
    
  end
  
  class StylingDash < Hashie::Dash
    property :link_color
    property :tag_foreground_color
    property :tag_background_color
  end
end