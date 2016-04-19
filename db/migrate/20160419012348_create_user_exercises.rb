class CreateUserExercises < ActiveRecord::Migration
  def change
    create_table :user_exercises do |t|
      t.references :user, index: true, foreign_key: true
      t.string :slug
      t.integer :iteration_count

      t.timestamps null: false
    end
  end
end
