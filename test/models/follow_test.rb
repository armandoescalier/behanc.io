require 'test_helper'

class FollowTest < ActiveSupport::TestCase
  test 'follow is invalid without follower and followed_user' do
    assert_raises(ActiveRecord::RecordInvalid) { Follow.create! }
  end

  test 'follow is valid with follower and followed_user' do
    follow = Follow.new
    follow.save
    assert_equal 'must exist', follow.errors.messages[:follower].first
    assert_equal 'must exist', follow.errors.messages[:followed_user].first
  end
end
