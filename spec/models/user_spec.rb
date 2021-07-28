require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:access_token)}
    it {should validate_presence_of(:uid)}
  end
end
