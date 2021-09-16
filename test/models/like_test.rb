require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  test 'Like is invalid without params' do
    like = Like.new
    assert_not like.save
  end

  test 'Like is valid with project and user ' do
    like = Like.new
    like.save
    assert_equal 'must exist', like.errors.messages[:project].first
    assert_equal 'must exist', like.errors.messages[:user].first
  end
end
