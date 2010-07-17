module Rubyoverflow
  class UserTimelineEvents < PagedBase
    attr_reader :user_timelines
    def initialize(hash, request_path = '')
      dash = UserTimelineEventsDash.new hash
      super(dash, request_path)
      @user_timelines = Array.new
      dash.user_timelines.each{|timelineHash| @user_timelines.push(UserTimelineEvent.new timelineHash)}
    end
    
    #Retrieves the next set of UserTimelineEvents using the same parameters used to retrieve the current set
    def get_next_set
      hash,url = perform_next_page_request
      UserTimelineEvents.new hash,url
    end
  
    class << self
      #Retrieves a set of timeline events for a set of user(s) by their id(s)
      #
      #id can be an int, string or an array of ints or strings
      #
      #Maps to 'users/{id}/timeline
      def retrieve_by_user(id, parameters = {})
        id = convert_to_id_list(id)
        hash, url = request('users/' + id.to_s + '/timeline',parameters)
        UserTimelineEvents.new hash, url
      end
    
    end
  end

  class UserTimelineEventsDash < PagedDash
    property :user_timelines
  end
end