class User < ActiveRecord::Base
  has_many :submissions
  has_many :comments
  has_many :user_exercises
  has_many :submissions, through: :user_exercises

  def self.from_omniauth(auth)
    where(uid: auth[:uid], provider: auth[:provider]).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.token = auth.credentials.token
    end
  end

  def purgatory?
    login_count == 1
  end

  def update_login_count
    update(login_count: self.login_count += 1)
  end
end
