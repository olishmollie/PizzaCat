class User < ApplicationRecord
  require('modules/encryption.rb')
  include Encryption
  has_many :ratings
  has_many :restaurants, through: :ratings
  before_save :encrypt_password

  def authenticate(password)
    password == decrypt(self.password)
  end

  def encrypt_password
    self.password = encrypt(self.password)
  end
end
