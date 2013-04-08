class User < ActiveRecord::Base
  include FacebookAuth::User
end