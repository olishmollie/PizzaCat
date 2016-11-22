require('modules/encryption.rb')

class User < ApplicationRecord
  include Encryption
  has_many :ratings
  has_many :restaurants, through: :ratings
  before_save :encrypt_password

  def has_rated?(restaurant)
    self.restaurants.exists?(restaurant.id)
  end

  def authenticate(password)
    encrypt(password) == self.password
  end

  def encrypt_password
    self.password = encrypt(self.password)
  end
end
