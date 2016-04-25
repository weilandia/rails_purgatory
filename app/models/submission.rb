class Submission < ActiveRecord::Base
  belongs_to :user_exercise
  has_many :comments, ->{ order(created_at: :asc) }, dependent: :destroy
  delegate :exercise, to: :user_exercise, allow_nil: true
  delegate :user, to: :user_exercise, allow_nil: true

  validates :solution, presence: true
  validates :user_exercise_id, presence: true

  default_scope { order(created_at: :desc) }
end
