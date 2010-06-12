class UserTimelineEvents < PagedBase
  attr_reader :user_timelines
  def initialize(hash)
    dash = UserTimelineEventsDash.new hash
    super(dash)
    @user_timelines = Array.new
    dash.user_timelines.each{|timelineHash| @user_timelines.push(UserTimelineEvent.new timelineHash)}
  end
  
  class << self
    #Retrieves a set of timeline events for a set of user(s) by their id(s)
    #
    #id can be an int, string or an array of ints or strings
    #
    #Maps to 'users/{id}/timeline
    def retrieve_by_user(id, parameters = {})
      id = convert_if_array(id)
      
      UserTimelineEvents.new request('users/'+id.to_s+'/timeline',parameters)
    end
    
  end
end

class UserTimelineEventsDash < PagedDash
  property :user_timelines
end