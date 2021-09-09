require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "authenticated users can get edit view of their own profile" do
    sign_in users(:joe)

    get edit_registrations_path

    assert_response :success
  end

  test "authenticated users can get other person profile" do
    sign_in users(:joe)
    other_user = users(:many)

    get profile_path other_user.username

    assert_response :success
  end
end
