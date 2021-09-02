require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'is valid if user have complete info' do
    new_user = User.new(user_data)

    assert new_user.valid?
  end

  test 'is invalid if first_name nil' do
    new_user = User.new(user_data(first_name: nil))

    refute new_user.valid?
  end

  test 'is invalid if last_name nil' do
    new_user = User.new(user_data(last_name: nil))

    refute new_user.valid?
  end

  test 'is invalid if username nil' do
    new_user = User.new(user_data(username: nil))

    refute new_user.valid?
  end

  private

  def user_data(attributes = {})
    { username: 'joedoee',
      first_name: 'joe',
      last_name: 'doe',
      email: 'joedoe@hotmail.com',
      occupation: 'pilot',
      company: 'michelada',
      password: 'password123',
      city: 'toluca',
      country: 'mexico' }.merge(attributes)
  end
end
