require 'rails_helper'

RSpec.describe 'Books index page' do
  it 'shows all of a users books' do
    dat_user = User.new(username: 'wanda@aim.com', access_token: "fakey_token", uid: 123)
  end

  it 'has the title as a link to the given books show page' do
  end

  it 'shows the author of the books' do
  end

  it 'shows the genre of the book' do
  end
end
