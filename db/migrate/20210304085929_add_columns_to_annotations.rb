class AddColumnsToAnnotations < ActiveRecord::Migration[6.0]
  def change
    add_column :annotations, :time_start, :integer
    add_column :annotations, :time_end, :integer
    add_column :annotations, :x_coordinate, :float
    add_column :annotations, :y_coordinate, :float
  end
end
