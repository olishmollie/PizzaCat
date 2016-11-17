class User < ApplicationRecord
  has_many :ratings
  has_many :restaurants, through: :ratings

  def authenticate(password)
    password == self.password
  end
end
