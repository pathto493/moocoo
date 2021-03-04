class Product < ApplicationRecord
  has_many :orders
  has_many :annotations

  has_many_attached :photos

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
