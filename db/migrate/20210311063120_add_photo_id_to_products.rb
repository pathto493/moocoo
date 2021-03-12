class AddPhotoIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :photo_id, :text, array: true, default: []
  end
end
