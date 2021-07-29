require 'rails_helper'
RSpec.describe 'User Dashboard' do
  before :each do
    @user = User.create!(username: 'Bob@Boberton.bobmail.com', access_token: 'token', uid: 'thisismyid')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit users_dashboard_path(@user.uid)
  end

  it 'displays user e-mail' do
    expect(page).to have_content(@user.username)
  end

  # it 'displays word stats' do
  # end

  it "displays link to user's book index" do
    expect(page).to have_button("My Beautiful Bevy of Books")
    click_button("My Beautiful Bevy of Books")
    expect(current_path).to eq(users_books_path(@user.id))
  end

  it "displays link to user's word index" do
    expect(page).to have_button("My Wordly World of Words")
    click_button("My Wordly World of Words")
    expect(current_path).to eq(users_words_path(@user.id))
  end

  it 'displays button to LOG OUT' do
    expect(page).to have_link('Log Out')
    click_link('Log Out')
    expect(current_path).to eq(root_path)
    expect(page).to have_content('You Have Been Logged Out')
    expect(page).to_not have_content('Log Out')
  end
end
