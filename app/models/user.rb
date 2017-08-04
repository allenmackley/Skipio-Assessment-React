class User < ApplicationRecord
  attr_accessor :skipio_api_token

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true, allow_blank: false, length: {minimum: 2, maximum: 50}
  validates :email, presence: true, allow_blank: false, format: { with: valid_email_regex }, uniqueness: {case_sensitive: false}

end
