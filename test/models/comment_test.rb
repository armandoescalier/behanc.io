require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'Comment is invalid without params' do
    comment = Comment.new
    assert_not comment.save
  end
end
