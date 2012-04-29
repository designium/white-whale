class User < ActiveRecord::Base
  attr_accessible :auth_token, :email, :password_digest, :password_reset_sent_at, :password_reset_token
end
