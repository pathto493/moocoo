class Video < ApplicationRecord
  has_many :annotations

  validates :title, presence: true
end
