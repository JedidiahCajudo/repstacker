class AddSetNumberAndWeightToWorkSets < ActiveRecord::Migration[8.1]
  def change
    add_column :work_sets, :set_number, :integer
  end
end
