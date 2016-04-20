class ExercisesSeed
  def self.generate_exercises
    exercises.each do |exercise|
      Exercise.create(exercise)
    end
  end

  private
    def self.exercises
      [
        {name: "first exercise",
          path: "spec/first_spec.rb",
          commit_message: "first commit message", text: first_exercise,
          encoded_text: Base64.encode64(first_exercise),
          solution_file: "app/models/solutions/first.rb",
          solution_method: Base64.encode64(first_solution)},
        {name: "second exercise",
          path: "spec/second_spec.rb",
          commit_message: "second commit message", text: second_exercise,
          encoded_text: Base64.encode64(second_exercise),
          solution_file: "app/models/solutions/second.rb",
          solution_method: Base64.encode64(first_solution)}
      ]
    end

    def self.first_exercise
      %(require "rails_helper"

RSpec.describe "GET /api/v1/customers" do
  xit "returns a list of all customers" do
    customer_one = create(:customer)
    customer_two = create(:customer, last_name: "two")

    get "/api/v1/customers"
  end
end)
    end

    def self.first_solution
      %(class Exercise < ActiveRecord::Base
        has_many :user_exercises
        before_validation :encode_exercise

        def encode_exercise
          self.encoded_text = Base64.encode64(text)
        end

        def parse_name
          path.gsub("spec/","").gsub("_spec.rb","")
        end
      end)
    end

    def self.second_exercise
      %(require "rails_helper"

RSpec.describe "GET /api/v1/customers" do
  xit "returns a list of all customers" do
    customer_one = create(:customer)
    customer_two = create(:customer, last_name: "two")

    get "/api/v1/customers"
  end
end)
    end

    def self.second_solution
      %(class Exercise < ActiveRecord::Base
        has_many :user_exercises
        before_validation :encode_exercise

        def encode_exercise
          self.encoded_text = Base64.encode64(text)
        end

        def parse_name
          path.gsub("spec/","").gsub("_spec.rb","")
        end
      end)
    end
end

ExercisesSeed.generate_exercises
