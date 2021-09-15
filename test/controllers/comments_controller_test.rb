require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'logged user can make a comment' do
    sign_in users(:joe)
    post project_comments_path(projects(:one), params: { comment: { content: 'hi' } })

    assert_redirected_to project_path(projects(:one))
  end
end
