class AddYoutubeIdToVidoes2 < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :youtube_id, :string
  end
end
