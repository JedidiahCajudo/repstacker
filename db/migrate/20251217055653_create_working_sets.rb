class CreateWorkingSets < ActiveRecord::Migration[8.1]
  def change
    create_table :working_sets do |t|
      t.integer :reps
      t.float :weight
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
