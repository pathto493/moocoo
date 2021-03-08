class Message < ApplicationRecord
  belongs_to :forum
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
end
