class Annotation < ApplicationRecord
  belongs_to :product
  belongs_to :video

  validates :video, uniqueness: { scope: :product,
    message: "One video can only have unique product" }
end
