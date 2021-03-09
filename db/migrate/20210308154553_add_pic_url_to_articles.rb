class AddPicUrlToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :pic_url, :string
  end
end
