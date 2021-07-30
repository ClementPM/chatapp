class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 10}
  has_secure_password
end
