class AddExerciseIdToWorkingSets < ActiveRecord::Migration[8.1]
  def change
    add_reference :working_sets, :exercise, null: false, foreign_key: true
  end
end
