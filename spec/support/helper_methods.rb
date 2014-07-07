
def sign_in_test_user(user)
  visit root_path
  click_on 'Sign In'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Sign in'
end
