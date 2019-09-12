require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: 'Ethan Hunt',
      email: 'ehunt@mreport.film',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  test 'authenticated? should return false for user without a digest' do
    assert_not @user.authenticated?('')
  end
end
