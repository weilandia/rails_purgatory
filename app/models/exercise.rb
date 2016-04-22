class Exercise < ActiveRecord::Base
  has_many :user_exercises
  before_save :encode_exercise
  before_save :encode_solution_frame
  before_create :add_level

  def encode_exercise
    self.encoded_spec = Base64.encode64(spec)
  end

  def encode_solution_frame
    self.encoded_solution_frame = Base64.encode64(solution_frame)
  end

  def parse_name
    spec_path.gsub("app/purgatory_challenges/_spec/","").gsub("_spec.rb","")
  end

  def add_level
    self.level = Exercise.count
  end
end
