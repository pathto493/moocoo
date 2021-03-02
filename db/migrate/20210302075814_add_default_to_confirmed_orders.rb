class AddDefaultToConfirmedOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :confirmed, :boolean, default: false
  end
end
