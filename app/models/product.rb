class Product < ApplicationRecord
  has_many :orders
  has_many :annotations
  has_many :reviews, dependent: :destroy

  belongs_to :brand, optional: true

  has_many_attached :photos

  monetize :price_cents

  validates :name, presence: true
  validates :price, presence: true

  include PgSearch::Model
  multisearchable against: [:name],
    using: {
      tsearch: { prefix: true }
  }

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end
