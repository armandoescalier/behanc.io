require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test 'authenticated users can get edit profile' do
    sign_in users(:joe)

    get edit_registrations_path

    assert_response :success
  end

  test 'no authenticated users can´t get edit profile route' do
    get edit_registrations_path

    assert_redirected_to new_user_session_path
  end
end
