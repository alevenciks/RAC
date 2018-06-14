When(/^I can create blogpost$/) do
  @blogpost = Blogpost.new(rand(36**20).to_s(36), rand(36**10).to_s(36))
  create_blogpost_positive(@blogpost, @user)
end

Then(/^I can get blogpost$/) do
  get_blogpost_positive(@blogpost, @user)
end

And(/^I can update blogpost$/) do
  update_blogpost_positive(@blogpost, @user)
end