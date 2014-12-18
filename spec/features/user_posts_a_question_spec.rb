require 'rails_helper'

feature "User posts a question", %q{
  As a user
  I want to post a question
  So that I can receive help from others} do

  # Acceptance Criteria
  #
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  context "authenticated user" do
    before(:each) do
      visit '/users/sign_up'
      fill_in "Email",                 with: "user@example.com"
      fill_in "Password",              with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
    end

    scenario "creates a post with validations" do
      visit '/questions/new'

      fill_in "Title", with: "Is this a legit question?"
      fill_in "Description", with: "I want to know if this is a legitamte question, do you think it is?"
      click_on "Submit"

      expect(page).to have_content "Question entered successfully!"
      expect(page).to have_content "Is this a legit question?"
      expect(page).to have_content "I want to know if this is a legitamte question, do you think it is?"
    end

    scenario "user submits a blank question form" do
      visit '/questions/new'

      click_on "Submit"

      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Description can't be blank"
    end

    scenario "creates a question without a title" do
      visit '/questions/new'

      fill_in "Description", with: "I want to know if this is a legitamte question"

      click_on "Submit"

      expect(page).to have_content "Title can't be blank"
    end

    scenario "creates a question without a description" do
      visit '/questions/new'

      fill_in "Title", with: "A"

      click_on "Submit"

      expect(page).to have_content "Description can't be blank"
    end
  end

  context "unauthenticated user" do
    scenario "can't post a question" do

    end
  end
end
