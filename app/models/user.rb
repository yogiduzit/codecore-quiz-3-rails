class User < ApplicationRecord
  has_secure_password 

  has_many :posts, dependent: :destroy


  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX 
end
