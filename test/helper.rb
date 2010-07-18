require 'rubygems'
require 'test/unit'
require 'spec'
require 'apikey'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rubyoverflow'
include Rubyoverflow

class Test::Unit::TestCase
end
def set_api_key
  Rubyoverflow::Client.config do |options|
    options.api_key = ApiKey.api_key
  end
end
def check_paged_class(paged_class, page_size)
  paged_class.should respond_to(:total)
  paged_class.should respond_to(:pagesize)
  paged_class.should respond_to(:page)
  paged_class.should respond_to(:request_path)
  paged_class.should respond_to(:query_parameters)
  paged_class.pagesize.should == page_size
end

def single_item_set
  {:pagesize => 1}
end

def check_user_set(users, page_size = 1)
  check_paged_class(users, page_size)
  users.should respond_to(:users)
  check_user users.users.first
end

def check_answer_set(answers, page_size = 1)
  check_paged_class(answers, page_size)
  answers.should respond_to(:answers)
  check_answer answers.answers.first
end

def check_api_site_set(api_sites, page_size = 1)
  check_paged_class(api_sites, page_size)
  api_sites.should respond_to(:api_sites)
  #check_api_site api_sites.api_sites.first
end

def check_badge_set(badges)
  badges.should respond_to(:badges)
  check_badge badges.badges.first
end

def check_comment_set(comments, page_size = 1)
  check_paged_class(comments, page_size)
  comments.should respond_to(:comments)
  #check_comment comments.comments.first
end

def check_post_timeline_event_set(post_timeline_events, page_size = 1)
  check_paged_class(post_timeline_events, page_size)
  post_timeline_events.should respond_to(:post_timelines)
  #check_post_timeline_event post_timeline_events.post_timelines.first
end

def check_rep_change_set(rep_changes, page_size = 1)
  check_paged_class(rep_changes, page_size)
  rep_changes.should respond_to(:rep_changes)
  #check_rep_change rep_changes.rep_changes.first
end

def check_revision_set(revisions, page_size = 1)
  check_paged_class(revisions, page_size)
  revisions.should respond_to(:revisions)
  #check_revision revisions.revisions.first
end

def check_tag_set(tags, page_size = 1)
  check_paged_class(tags, page_size)
  tags.should respond_to(:tags)
  #check_tag tags.tags.first
end

def check_user_timeline_event_set(user_timeline_events, page_size = 1)
  check_paged_class(user_timeline_events, page_size)
  user_timeline_events.should respond_to(:user_timelines)
  #check_user_timeline_event user_timeline_events.user_timelines.first
end

def check_question_set(questions, page_size = 1)
  check_paged_class(questions, page_size)
  questions.should respond_to(:questions)
  #check_question questions.questions.first
end

def check_answer(answer)
  answer.should respond_to(:answer_id)
  answer.should respond_to(:accepted)
  answer.should respond_to(:answer_comments_url)
  answer.should respond_to(:question_id)
  answer.should respond_to(:locked_date)
  answer.should respond_to(:owner)
  answer.should respond_to(:creation_date)
  answer.should respond_to(:last_edit_date)
  answer.should respond_to(:last_activity_date)
  answer.should respond_to(:up_vote_count)
  answer.should respond_to(:down_vote_count)
  answer.should respond_to(:view_count)
  answer.should respond_to(:score)
  answer.should respond_to(:community_owned)
  answer.should respond_to(:title)
  answer.should respond_to(:body)
  answer.should respond_to(:comments)
end


def check_badge(badge)
  badge.should respond_to(:badge_id)
  badge.should respond_to(:rank)
  badge.should respond_to(:name)
  badge.should respond_to(:description)
  badge.should respond_to(:award_count)
  badge.should respond_to(:tag_based)
  badge.should respond_to(:user)
  badge.should respond_to(:badges_recipients_url)
end


def check_user(user)
  user.should respond_to(:user_id)
  user.should respond_to(:user_type)
  user.should respond_to(:creation_date)
  user.should respond_to(:display_name)
  user.should respond_to(:reputation)
  user.should respond_to(:email_hash)
  user.should respond_to(:age)
  user.should respond_to(:last_access_date)
  user.should respond_to(:website_url)
  user.should respond_to(:location)
  user.should respond_to(:about_me)
  user.should respond_to(:question_count)
  user.should respond_to(:answer_count)
  user.should respond_to(:view_count)
  user.should respond_to(:up_vote_count)
  user.should respond_to(:down_vote_count)
  user.should respond_to(:accept_rate)
  user.should respond_to(:user_questions_url)
  user.should respond_to(:user_answers_url)
  user.should respond_to(:user_favorites_url)
  user.should respond_to(:user_tags_url)
  user.should respond_to(:user_badges_url)
  user.should respond_to(:user_timeline_url)
  user.should respond_to(:user_mentioned_url)
  user.should respond_to(:user_comments_url)
  user.should respond_to(:user_reputation_url)
  user.should respond_to(:badge_counts)
  user.should respond_to(:timed_penalty_date)
  user.should respond_to(:association_id)
  user.should respond_to(:on_site)
end
