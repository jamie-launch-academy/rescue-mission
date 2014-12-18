require 'rails_helper'

feature "user registration" do
  it "allows new users to register with an email address and password" do
    visit '/users/sign_up'

    fill_in "Email",                 :with => "user@example.com"
    fill_in "Password",              :with => "password"
    fill_in "Password confirmation", :with => "password"

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
