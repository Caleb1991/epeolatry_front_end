require 'rails_helper'
RSpec.describe 'User Dashboard' do
  before :each do
    user = User.create!(username: 'Bob@Boberton.bobmail.com', access_token: 'token', uid: 'thisismyid')
    # visit root_path
    #authentication - combine two into test for login functionality; delete below
    visit users_dashboard_path(user.uid)
  end

  it 'displays user e-mail' do
    expect(page).to have_content(user.username)
  end

  # it 'displays word stats' do
  # end
  #
  # it "displays link to user's book index" do
  # end
  #
  # it "displays link to user's word index" do
  # end

  it 'displays button to LOG OUT' do
    expect(page).to have_button('Log Out')
    click_button('Log Out')
    expect(current_path).to eq(root_path)
    # expect(page).to have_content('You Have Been Logged Out')
  end
end
