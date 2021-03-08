class Review < ApplicationRecord
  belongs_to :video
  belongs_to :user

  validates :comment, presence: true
  validates :rating, presence: true
end
