require 'rails_helper'

RSpec.feature "user logs in for the first time and goes through onboarding" do
  scenario "user logs in for the first time" do
    VCR.use_cassette("sessions.login") do
      stub_omniauth

      visit "/"
      click_on "signin with github"

      service = GithubService.new(User.last)
      expect(current_path).to eq(new_user_purgatory_path(User.last.nickname))
      expect(page).to_not have_content("git clone")

      click_on "begin."

      expect(service.purgatory?).to eq(true)

      Exercise.all.each do |exercise|
        expect(page).to have_content(exercise.name)
      end

      expect(current_path).to eq(user_path(User.last.nickname))

      click_on "div#exercise-2"

      expect(current_path).to eq(user_path(User.last.nickname))

      click_on "div#exercise-1"

      expect(current_path).to eq(user_exercise_path(UserExercise.first.name))
    end
 end
end
