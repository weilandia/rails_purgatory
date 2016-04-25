require 'rails_helper'

RSpec.describe UserExercise, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :exercise_id }
  it { should belong_to :user }
  it { should belong_to :exercise }
  it { should have_many :submissions }
end
