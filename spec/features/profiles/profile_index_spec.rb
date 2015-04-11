require 'spec_helper'

# When I visit the site,
# I want be able to view developer profiles
# so that I may find a suitable jr dev for my company.

feature 'Viewing profiles' do
  scenario 'visiting the index' do
    visit profiles_path

    expect(page).to have_css 'h1', text: 'Profiles'
  end
end
