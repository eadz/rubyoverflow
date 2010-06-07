class PagedBase < Base
  attr_reader :total
  attr_reader :pagesize
  attr_reader :page
  
  def initialize(dash)
    @total = dash.total
    @page = dash.page
    @pagesize = dash.pagesize
  end
end