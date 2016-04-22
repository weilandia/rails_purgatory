class UserExercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise

  has_many :submissions, ->{ order created_at: :asc }

  def level_up(user)
    if submission == 0
      self.submission = 1
      user.update(level: user.level += 1)
    end
  end
end
