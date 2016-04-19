class ExercisesSeed
  def self.generate_exercises
    exercises.each do |exercise|
      Exercise.create(exercise)
    end
  end

  private
    def self.exercises
      [{name: "first exercise", path: "/spec/first.rb", commit_message: "first commit message", text: first_exercise}, {name: "second exercise", path: "/spec/second.rb", commit_message: "second commit message", text: second_exercise}]
    end

    def self.first_exercise
      %(require "rails_helper"

RSpec.describe "GET /api/v1/customers" do
  it "returns a list of all customers" do
    customer_one = create(:customer)
    customer_two = create(:customer, last_name: "two")

    get "/api/v1/customers"
  end
end)
    end

    def self.second_exercise
      %(require "rails_helper"

RSpec.describe "GET /api/v1/customers" do
  it "returns a list of all customers" do
    customer_one = create(:customer)
    customer_two = create(:customer, last_name: "two")

    get "/api/v1/customers"
  end
end)
    end
end

ExercisesSeed.generate_exercises