class AddLengthInSecondsToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :length_in_seconds, :integer
  end
end
