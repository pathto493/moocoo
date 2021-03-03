class AddDefaultToConfirmedOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :confirmed, :boolean, default: false
  end
end
