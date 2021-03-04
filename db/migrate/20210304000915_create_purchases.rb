class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :total_price
      t.string :checkout_session_id
      t.string :state
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
