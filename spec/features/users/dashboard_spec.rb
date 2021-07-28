require 'rails_helper'
RSpec.describe 'User Dashboard' do
  before :each do
    user = User.create!(username: 'Bob Boberton', access_token: 'token', uid: 'thisismyid')
    # visit root_path
    #authentication - combine two into test for login functionality; delete below
    visit dashboard_index_path
  end

  it 'displays user e-mail' do
  end

  it 'displays word stats' do
  end

  it "displays link to user's book index" do
  end

  it "displays link to user's word index" do
  end
end
