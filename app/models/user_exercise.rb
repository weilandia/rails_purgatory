class UserExercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise

  has_many :submissions, ->{ order created_at: :asc }
end
