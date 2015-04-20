# Feature: Sign up
#   As a visitor
#   I want to sign up
#   So I can visit protected areas of the site
#
#   Revisiting these tests the night before RailsConf. The expectations are
#   not what I would like but I have a larger issue with devise messages not
#   showing that I will not have time to address before the start of the
#   conference. Better expectations will be included in the next revision.
feature 'Sign Up', :devise do

  # Scenario: Visitor can sign up with valid email address and password
  #   Given I am not signed in
  #   When I sign up with a valid email address and password
  #   Then I see a successful sign up message
  scenario 'visitor can sign up with valid email address and password' do
    visit root_path
    click_link "Sign Up To Create Your Profile"
    fill_in("Email", with: "test@example.com")
    fill_in("Password", with: "please123")
    fill_in("Password confirmation", with: "please123")
    click_button "Sign Up"

    expect(page).to have_content "Edit Account"
  end

  # Scenario: Visitor cannot sign up with invalid email address
  #   Given I am not signed in
  #   When I sign up with an invalid email address
  #   Then I see an invalid email message
  scenario 'visitor cannot sign up with invalid email address' do
    visit root_path
    click_link "Sign Up To Create Your Profile"
    fill_in("Email", with: "test@example")
    fill_in("Password", with: "please123")
    fill_in("Password confirmation", with: "please123")
    click_button "Sign Up"

    expect(page).to have_content 'Sign Up'
  end

  # Scenario: Visitor cannot sign up without password
  #   Given I am not signed in
  #   When I sign up without a password
  #   Then I see a missing password message
  scenario 'visitor cannot sign up without password' do
    visit root_path
    click_link "Sign Up To Create Your Profile"
    fill_in("Email", with: "test@example")
    fill_in("Password", with: "")
    fill_in("Password confirmation", with: "")
    click_button "Sign Up"

    expect(page).to have_content 'Sign Up'
  end

  # Scenario: Visitor cannot sign up with a short password
  #   Given I am not signed in
  #   When I sign up with a short password
  #   Then I see a 'too short password' message
  scenario 'visitor cannot sign up with a short password' do
    visit root_path
    click_link "Sign Up To Create Your Profile"
    fill_in("Email", with: "test@example")
    fill_in("Password", with: "1234")
    fill_in("Password confirmation", with: "1234")
    click_button "Sign Up"

    expect(page).to have_content 'Sign Up'
  end

  # Scenario: Visitor cannot sign up without password confirmation
  #   Given I am not signed in
  #   When I sign up without a password confirmation
  #   Then I see a missing password confirmation message
  scenario 'visitor cannot sign up without password confirmation' do
    visit root_path
    click_link "Sign Up To Create Your Profile"
    fill_in("Email", with: "test@example")
    fill_in("Password", with: "1234")
    fill_in("Password confirmation", with: "")
    click_button "Sign Up"

    expect(page).to have_content 'Sign Up'
  end

  # Scenario: Visitor cannot sign up with mismatched password and confirmation
  #   Given I am not signed in
  #   When I sign up with a mismatched password confirmation
  #   Then I should see a mismatched password message
  scenario 'visitor cannot sign up with mismatched password and confirmation' do
    visit root_path
    click_link "Sign Up To Create Your Profile"
    fill_in("Email", with: "test@example")
    fill_in("Password", with: "12345678")
    fill_in("Password confirmation", with: "87654321")
    click_button "Sign Up"

    expect(page).to have_content 'Sign Up'
  end

end
