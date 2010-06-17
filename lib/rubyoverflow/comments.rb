module Rubyoverflow
  class Comments < PagedBase
  
    attr_reader :comments
  
    def initialize(hash, request_path = '')
      dash = CommentsDash.new hash
    
      @comments = Array.new
      dash.comments.each{ |commentHash| @comments.push(Comment.new commentHash)}
    
      super(dash, request_path)
    end
    
    #Retrieves the next set of comments using the same parameters used to retrieve the current set
    def get_next_set
      hash,url = perform_next_page_request
      Comments.new hash,url
    end
  
    class << self
    
      #Retieves a set of comments by a set by their ids
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to 'comments/{id}
      def retrieve_by_id(id, parameters = {})
        id = convert_if_array(id)
      
        hash, url = request('comments/'+id.to_s, parameters)
        Comments.new hash, url
      end
    
      #Retrieves a set of comments made by a set of users by their ids
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to 'users/{id}/comments'
      def retrieve_by_user(id, parameters={})
        id = convert_if_array(id)
      
        hash, url = request('users/'+id.to_s+"/comments", parameters)
        Comments.new hash, url
      end
    
      #Retrieves a set of comments made on an answer by the answer's id
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to 'answers/{id}/comments'
      def retrieve_by_answer(id, parameters={})
        id = convert_if_array(id)
      
        hash, url = request('answers/'+id.to_s+"/comments", parameters)
        Comments.new hash, url
      end
    
      #Retrieves a set of comments made on a post by the post's id
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to 'posts/{id}/comments'
      def retrieve_by_post(id, parameters={})
        id = convert_if_array(id)
      
        hash, url = request('posts/'+id.to_s+"/comments", parameters)
        Comments.new hash, url
      end
    
      #Retrieves a set comments made on a question by the post's id
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to 'question/{id}/comments'
      def retrieve_by_question(id, parameters={})
        id = convert_if_array(id)
      
        hash, url = request('questions/'+id.to_s+"/comments", parameters)
        Comments.new hash, url
      end
    
      #Retrieves a set of comments made by a set of users to a user
      #
      #id can be an int, string, or an array of ints or strings
      #
      #toid must be an int or string
      #
      #Maps to 'users/{id}/comments/{toid}'
      def retrieve_from_user_to_user(id, toid, parameters={})
        id = convert_if_array(id)
      
        hash, url = request('users/'+id.to_s+"/comments/" + toid.to_s, parameters)
        Comments.new hash, url
      end
    
      #Retieves a set commments directed at a set of users by their ids
      #
      #id can be an int, string, or an array of ints or strings
      #
      #Maps to 'users/{id}/mentioned'
      def retrieve_to_user(id, parameters={})
        id = convert_if_array(id)
      
        hash, url = request('users/'+id.to_s+"/mentioned", parameters)
        Comments.new hash, url
      end
    end
  
  end

  class CommentsDash < PagedDash
    property :comments
  end
end