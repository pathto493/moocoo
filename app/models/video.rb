class Video < ApplicationRecord
  has_many :annotations

  validates :title, presence: true

  # include PgSearch::Model
  # pg_search_scope :search_by_video_title_and_tags,
  #   against: [ :title, :tags ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }

  include PgSearch::Model
  multisearchable against: [:title, :tags]
end
