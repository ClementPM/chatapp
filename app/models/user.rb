class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensituve: false }, length: { minimum: 4, maximum: 10}
  has_many :messages
  has_secure_password
end
