class PostTimelineEvents < PagedBase
  attr_reader :post_timelines
  def initialize(hash)
    dash = PostTimelineEventsDash.new hash
    super(dash)
    
    @post_timelines = Array.new
    dash.post_timelines.each {|postTimeHash| @post_timelines.push(PostTimelineEvent.new postTimeHash)}
  end
  
  class << self
    
    #Retrieve a set of PostTimelineEvent for a set of question(s) by their id(s)
    #
    #id can be an int, string, or an array of ints or strings
    #
    #Maps to 'questions/{id}/timeline'
    def retrieve_by_question(id, parameters = {})
      id = convert_if_array(id)
      
      PostTimelineEvents.new request('questions/' + id.to_s + '/timeline', parameters)
    end
  end
  
end

class PostTimelineEventsDash < PagedDash
  property :post_timelines
end