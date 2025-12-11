class CreateWorkSets < ActiveRecord::Migration[8.1]
  def change
    create_table :work_sets do |t|
      t.integer :reps
      t.integer :weight
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
