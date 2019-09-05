require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup info' do
    get signup_path

    assert_no_difference 'User.count' do
      post signup_path, params: {
        user: {
          name: '',
          email: 'user@example',
          password: 'dude',
          password_confirmation: 'sup?'
        }
      }
    end

    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test 'valid signup ' do
    get signup_path

    assert_difference 'User.count' do
      post signup_path, params: {
        user: {
          name: 'Kiraitu Murungi',
          email: 'kmurungi@example.com',
          password: '123456',
          password_confirmation: '123456'
        }
      }
      follow_redirect!
      assert_template 'users/show'
      assert_not flash.empty?
      assert logged_in?
    end
  end
end
