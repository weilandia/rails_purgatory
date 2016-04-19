class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :text
      t.string :encoded_text
      t.string :path
      t.string :commit_message

      t.timestamps null: false
    end
  end
end
