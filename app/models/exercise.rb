class Exercise < ActiveRecord::Base
  has_many :user_exercises
  before_save :encode_exercise
  before_save :encode_solution_frame

  def encode_exercise
    self.encoded_spec = Base64.encode64(spec)
  end

  def encode_solution_frame
    self.encoded_solution_frame = Base64.encode64(solution_frame)
  end

  def parse_name
    spec_path.gsub("spec/challenges/","").gsub("_spec.rb","")
  end
end
