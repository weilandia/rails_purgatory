class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :spec
      t.string :encoded_spec
      t.string :spec_path
      t.string :solution_frame
      t.string :encoded_solution_frame
      t.string :solution_frame_path

      t.timestamps null: false
    end
  end
end
