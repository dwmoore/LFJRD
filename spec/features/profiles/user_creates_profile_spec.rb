require 'spec_helper'

feature 'User creates profile' do
  scenario 'successfully' do
    user = create(:user)
    visit new_profile_path
    fill_in 'email', with: 'user@email.com'
    click_button 'Update Profile'

    expect(page).to have_css '.profile', text: 'user@email.com'
  end
end
