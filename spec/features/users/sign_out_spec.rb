# Feature: Sign out
#   As a user
#   I want to sign out
#   So I can protect my account from unauthorized access
feature 'Sign out', :devise do

  # Scenario: User signs out successfully
  #   Given I am signed in
  #   When I sign out
  #   Then I see a signed out message
  scenario 'user signs out successfully' do
    FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in("Email", with: "test@example.com")
    fill_in("Password", with: "please123")
    click_button "Sign In"

    expect(page).to have_content "Sign Out"
    click_link 'Sign Out'
    expect(page).to have_content "Sign In"
  end

end


