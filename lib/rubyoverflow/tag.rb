module Rubyoverflow
  class Tag
    attr_reader :name
    attr_reader :count
    attr_reader :restricted_to
    attr_reader :fulfills_required
    attr_reader :user_id
  
    def initialize(hash, request_path = '')
      dash = TagDash.new hash
      @name = dash.name
      @count = dash.count
      @restricted_to = dash.restricted_to
      @fulfills_required = dash.fulfills_required
      @user_id = dash.user_id
    end
  
  end

  class TagDash < Hashie::Dash
    property :name
    property :count
    property :restricted_to
    property :fulfills_required
    property :user_id
  end
end