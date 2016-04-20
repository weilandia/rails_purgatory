class Exercise < ActiveRecord::Base
  has_many :user_exercises
  before_validation :encode_exercise

  def encode_exercise
    self.encoded_text = Base64.encode64(text)
  end

  def parse_name
    path.gsub("/spec/","").gsub(".rb","")
  end
end
