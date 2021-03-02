class Product < ApplicationRecord
  has_many :orders
  has_many :annotations

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
