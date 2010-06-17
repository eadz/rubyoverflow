module Rubyoverflow
  class PagedBase < Base
    attr_reader :total
    attr_reader :pagesize
    attr_reader :page
    attr_reader :request_path
    attr_reader :query_parameters
  
    def initialize(dash, request_path)
      @total = dash.total
      @page = dash.page
      @pagesize = dash.pagesize
      @request_path,@query_parameters = find_parse_querystring(request_path)
    end
    
    def next_page_parameters()
      temp = @query_parameters
      if temp['page'].respond_to?(:to_int)
        temp['page'] = temp['page'].to_i +1
      else
        temp["page"] = 2
      end
      return temp
    end
  end
end