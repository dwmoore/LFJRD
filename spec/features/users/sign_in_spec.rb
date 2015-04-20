# Feature: Sign in
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature 'Sign in', :devise do

  # Scenario: User cannot sign in if not registered
  #   Given I do not exist as a user
  #   When I sign in with valid credentials
  #   Then I see an invalid credentials message
  scenario 'user cannot sign in if not registered' do
    visit root_path
    click_link "Sign In"
    click_button "Sign In"
    expect(page).to have_content "Sign In"
  end

  # Scenario: User can sign in with valid credentials
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see a success message
  scenario 'user can sign in with valid credentials' do
    FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in("Email", with: "test@example.com")
    fill_in("Password", with: "please123")
    click_button "Sign In"

    expect(page).to have_content "Edit Account"
  end

  # Scenario: User cannot sign in with wrong email
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with a wrong email
  #   Then I see an invalid email message
  scenario 'user cannot sign in with wrong email' do
    FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in("Email", with: "wrong@example.com")
    fill_in("Password", with: "please123")
    click_button "Sign In"

    expect(page).to have_content "Sign In"
  end

  # Scenario: User cannot sign in with wrong password
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with a wrong password
  #   Then I see an invalid password message
  scenario 'user cannot sign in with wrong password' do
    FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in("Email", with: "test@example.com")
    fill_in("Password", with: "wrong")
    click_button "Sign In"
    expect(page).to have_content "Sign In"
  end

end
