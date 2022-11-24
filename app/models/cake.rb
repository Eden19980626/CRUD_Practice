class Cake < ApplicationRecord
  validates :name, :price, presence: :true
end
