class ChangeVideoUrlName < ActiveRecord::Migration[6.1]
  def change
    rename_column :videos, :vieo_url, :video_url
    add_column :videos, :video_type, :string
  end
end
