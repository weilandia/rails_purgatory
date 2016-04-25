require 'rails_helper'

RSpec.feature "guest user visits unauthorized page" do
  scenario "guest gets redirected to root" do
    VCR.use_cassette("application.authorize!") do
      visit "/weilandia"
      expect(current_path).to eq("/")
    end
  end
end
