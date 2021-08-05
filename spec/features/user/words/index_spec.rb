require 'rails_helper'

RSpec.describe 'word index' do
  before :each do
    @user_1 = User.create!(
      username: 'test@gmail.com', 
      access_token: 'fake token', 
      uid: '1233'
    )
    VCR.turn_on!
  end

  describe 'visiting the page' do
    it 'shows all of a users words' do
      VCR.turn_off!
      User::WordsController.any_instance.stub(:current_user).and_return(@user_1)
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/words?user_id=#{@user_1.id}").
      to_return(status: 200, body: File.open('./spec/fixtures/user_words_index_fixture.json').read, headers: {})

      visit user_words_path

      expect(page).to have_content('SAD', count: 3)
    end
  end
end