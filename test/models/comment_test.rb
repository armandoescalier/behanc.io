require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'Comment is invalid without content' do
    assert_raises(ActiveRecord::RecordInvalid) { Comment.create! }
  end
end
