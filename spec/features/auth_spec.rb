require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can login and out' do
    create_user email: "user@example.com"

    visit root_path
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("user@example.com")
  end

  scenario 'User registers and auto logs in' do
    visit root_path
    click_on "Register"
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "bob@example.com"
    fill_in "Password", with: "123"
    fill_in "Confirm", with: "123"
    click_button "Register"
    expect(page).to have_content("bob@example.com")
    expect(page).to have_no_content("Login")
  end

end
