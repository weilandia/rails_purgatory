class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission

  validates :body, presence: true
  validates :user_id, presence: true
  validates :submission_id, presence: true

  def image_url
    user.image_url
  end
end
