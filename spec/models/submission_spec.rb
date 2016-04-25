require 'rails_helper'

RSpec.describe Submission, type: :model do
  it { should validate_presence_of :solution }
  it { should validate_presence_of :user_exercise_id }
  it { should belong_to :user_exercise }
  it { should have_many :comments }
end
