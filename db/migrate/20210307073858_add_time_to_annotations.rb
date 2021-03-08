class AddTimeToAnnotations < ActiveRecord::Migration[6.0]
  def change
    add_column :annotations, :time_start, :integer
  end
end
