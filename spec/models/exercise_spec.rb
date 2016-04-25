require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :spec }
  it { should validate_presence_of :spec_path }
  it { should validate_presence_of :solution_frame }
  it { should validate_presence_of :solution_frame_path }
  it { should validate_presence_of :level }
  it { should have_many :user_exercises}

  before(:each) do
    @exercise = create(:exercise)
  end

  it "parses exercise name" do
    expect(@exercise.parse_name).to eq("exercise")
  end
end
