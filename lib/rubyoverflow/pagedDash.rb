module Rubyoverflow
  class PagedDash < Hashie::Dash
    property :total
    property :pagesize
    property :page
  end
end