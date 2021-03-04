class Product < ApplicationRecord
  has_many :orders
  has_many :annotations

  has_many_attached :photos

  monetize :price_cents

  validates :name, presence: true
  validates :price, presence: true
end
