require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'logged user can make a comment' do
    sign_in users(:joe)

    post project_comments_path(projects(:one), params: { comment: { content: 'hi' } })

    assert_equal 'Comment created', flash[:notice]
  end

  test 'success if comment deleted' do
    comment = comments(:one)
    sign_in comment.user

    delete project_comment_path(comment.project, comment)

    assert_equal 'Comment deleted', flash[:notice]
  end

  test 'fails if comment not found' do
    sign_in users(:joe)

    delete project_comment_path(projects(:one), 25)

    assert_equal 'Comment not found', flash[:alert]
  end
end
