class Room < ApplicationRecord
  validates :name, :price, presence: true
end
