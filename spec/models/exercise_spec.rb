require 'rails_helper'

RSpec.describe Exercise, type: :model do
  before(:each) do
    @exercise = create(:exercise)
  end

  it "parses exercise name" do
    expect(@exercise.parse_name).to eq("exercise")
  end

end
