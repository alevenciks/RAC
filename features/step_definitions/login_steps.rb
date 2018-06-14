Given(/^I have logged in as a regular user$/) do
  @user = User.new('aleksejs@siltumnica.com', 'password1')
  login_positve(@user)
end

Given(/^I try to log in using an invalid password$/) do
  @user = User.new('aleksejs@siltumnica.com', 'parole2')
  login_wrong_password(@user)
end

Then(/^I check if I am not logged in$/) do
  check_if_user_not_logged(@user)
end