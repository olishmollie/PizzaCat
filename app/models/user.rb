class User < ApplicationRecord
  has_many :ratings
  has_many :restaurants, through: :ratings
end
