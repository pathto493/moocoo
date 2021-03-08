class AddImageFilePathColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :image_file_path, :text
  end
end
