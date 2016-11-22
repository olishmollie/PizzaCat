class Rating < ApplicationRecord
  include ActiveModel::Dirty
  belongs_to :user
  belongs_to :restaurant
end
