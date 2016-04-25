class Exercise < ActiveRecord::Base
  has_many :user_exercises
  before_save :encode_exercise
  before_save :encode_solution_frame

  validates :name, presence: true
  validates :spec, presence: true
  validates :spec_path, presence: true
  validates :solution_frame, presence: true
  validates :solution_frame_path, presence: true
  validates :level, presence: true

  default_scope { order(:level) }

  def encode_exercise
    self.encoded_spec = Base64.encode64(spec)
  end

  def encode_solution_frame
    self.encoded_solution_frame = Base64.encode64(solution_frame)
  end

  def parse_name
    spec_path.gsub("app/purgatory_challenges/_spec/","").gsub("_spec.rb","")
  end
end
