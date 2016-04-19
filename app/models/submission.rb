class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_exercise
  has_many :comments, ->{ order(created_at: :asc) }, dependent: :destroy
end
