class AddCreatorToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :creator, :string
  end
end
