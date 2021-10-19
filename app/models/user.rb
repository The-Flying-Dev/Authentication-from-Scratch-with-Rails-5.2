class User < ApplicationRecord
  #takes care of encrypting the password
  has_secure_password
   
  #the email must be unique
  validates :email, presence: true, uniqueness: true
end
