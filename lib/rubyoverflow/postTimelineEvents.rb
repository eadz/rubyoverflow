module Rubyoverflow
  class PostTimelineEvents < PagedBase
    attr_reader :post_timelines
    
    def initialize(hash, request_path = '')
      dash = PostTimelineEventsDash.new hash
      super(dash, request_path)
    
      @post_timelines = Array.new
      dash.post_timelines.each {|postTimeHash| @post_timelines.push(PostTimelineEvent.new postTimeHash)}
    end
    
    #Retrieves the next set of PostTimelineEvents using the same parameters used to retrieve the current set
    def get_next_set
      hash,url = perform_next_page_request
      PostTimelineEvents.new hash,url
    end
  
    class << self
    
      #Retrieve a set of PostTimelineEvent for a set of question(s) by their id(s)
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to 'questions/{id}/timeline'
      def retrieve_by_question(id, parameters = {})
        id = convert_to_id_list(id)
      
        hash, url = request('questions/' + id.to_s + '/timeline', parameters)
        PostTimelineEvents.new hash, url
      end
    end
  
  end

  class PostTimelineEventsDash < PagedDash
    property :post_timelines
  end
end