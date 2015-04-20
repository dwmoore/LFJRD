require 'spec_helper'

# When I visit the site,
# I want be able to view developer profiles
# so that I may find a suitable jr dev for my company.

feature 'Viewing a developer profile' do
  describe "viewing a profile" do
    it "renders the profile" do
      profile = FactoryGirl.create(:profile)
      visit profile_path(profile)

      expect(page).to have_content "Mike Mulligan"
    end
  end

end
