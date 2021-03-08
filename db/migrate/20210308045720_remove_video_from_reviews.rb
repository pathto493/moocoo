class RemoveVideoFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :video, null: false, foreign_key: true
  end
end
