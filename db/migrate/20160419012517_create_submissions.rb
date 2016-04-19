class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :user, index: true, foreign_key: true
      t.string :slug
      t.string :code
      t.references :user_exercise, index: true, foreign_key: true
      t.string :filename

      t.timestamps null: false
    end
  end
end
