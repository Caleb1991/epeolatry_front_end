class User < ApplicationRecord
  validates_presence_of :username, :access_token, :uid
end
