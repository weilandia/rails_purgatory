class UserExercise < ActiveRecord::Base
  belongs_to :user

  has_many :submissions, ->{ order created_at: :asc }
end
