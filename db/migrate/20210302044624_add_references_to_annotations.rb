class AddReferencesToAnnotations < ActiveRecord::Migration[6.1]
  def change
    add_reference :annotations, :video, foreign_key: true
    add_reference :annotations, :product, foreign_key: true
  end
end
