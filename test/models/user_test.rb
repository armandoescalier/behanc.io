require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'is valid' do
    new_user = User.new(user_data)
    assert new_user.valid?
  end

  test 'is invalid' do
    new_user = User.new(user_data(first_name: nil))
    refute new_user.valid?
  end

  private

  def user_data(attributes = {})
    { first_name: 'joe',
      last_name: 'doe',
      email: 'joedoe@gmail.com',
      carrer: 'pilot',
      company: 'michelada',
      password: 'password123',
      password_confirmation: 'password123',
      city: 'toluca',
      country: 'mexico' }.merge(attributes)
  end
end
