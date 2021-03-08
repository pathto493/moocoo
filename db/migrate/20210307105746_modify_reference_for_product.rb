class ModifyReferenceForProduct < ActiveRecord::Migration[6.0]
  def change
    remove_reference :products, :brands, foreign_key: true
  end
end
