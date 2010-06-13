class PagedBase < Base
  attr_reader :total
  attr_reader :pagesize
  attr_reader :page
  attr_reader :request_path
  
  def initialize(dash, request_path)
    @total = dash.total
    @page = dash.page
    @pagesize = dash.pagesize
    @request_path = request_path
  end
end