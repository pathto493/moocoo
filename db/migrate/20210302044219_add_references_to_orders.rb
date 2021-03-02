class AddReferencesToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :user, foreign_key: true
    add_reference :orders, :product, foreign_key: true
    add_column :orders, :confirmed, :boolean
  end
end
