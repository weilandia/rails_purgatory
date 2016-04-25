require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    create(:exercise)
    @user = create(:user)
  end

  it "determines if an exercise is complete" do
    expect(@user.completed_exercise?(1)).to eq(0)

    user_exercise = @user.user_exercises.create(exercise_id: 1, submission: 0)
    user_exercise.submissions.create(solution: "this is a solution", encoded_solution: "cmVxdWlyZSAnYWN0aXZlX")
    user_exercise.update(submission: 1)

    expect(@user.completed_exercise?(1)).to eq(1)
  end

  it "levels up user" do
    @user.level_up
    expect(@user.level).to eq(1)

    user_exercise = @user.user_exercises.create(exercise_id: 1, submission: 0)
    user_exercise.submissions.create(solution: "this is a solution", encoded_solution: "cmVxdWlyZSAnYWN0aXZlX")
    user_exercise.update(submission: 1)

    @user.level_up
    expect(@user.level).to eq(2)
  end
end
