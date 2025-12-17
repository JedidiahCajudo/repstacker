class DropWorkSets < ActiveRecord::Migration[8.1]
  def change
    drop_table :work_sets
  end
end
