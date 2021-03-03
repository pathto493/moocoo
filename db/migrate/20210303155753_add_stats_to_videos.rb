class AddStatsToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :tags, :string
    add_column :videos, :likes, :integer
    add_column :videos, :views, :integer
  end
end
