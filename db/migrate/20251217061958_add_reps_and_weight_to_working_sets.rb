class AddRepsAndWeightToWorkingSets < ActiveRecord::Migration[8.1]
  def change
    add_column :working_sets, :reps, :integer
    add_column :working_sets, :weight, :float
  end
end
