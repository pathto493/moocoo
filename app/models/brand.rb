class Brand < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true

  include PgSearch::Model
  multisearchable against: [:name],
    using: {
      tsearch: { prefix: true }
  }
end
