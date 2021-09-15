require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  test 'Like is invalid without project and user' do
    assert_raises(ActiveRecord::RecordInvalid) { Like.create! }
  end

  test 'Like is valid with project and user ' do
    like = Like.new
    like.save
    assert_equal 'must exist', like.errors.messages[:project].first
    assert_equal 'must exist', like.errors.messages[:user].first
  end
end
