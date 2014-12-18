require 'rails_helper'

feature "User can view all questsions", %q{
  As a user
  I want to view recently posted questions
  So that I can help others} do

  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  context "authenticated user" do
    before(:each) do
      visit '/users/sign_up'
      fill_in "Email",                 with: "user@example.com"
      fill_in "Password",              with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
    end

    scenario "views all questions" do
      visit '/questions/new'

      fill_in "Title", with: "Is this a legit question?"
      fill_in "Description", with: "x" * 51

      click_on "Submit"

      visit '/questions/new'

      fill_in "Title", with: "Really, is this a legit question?"
      fill_in "Description", with: "x" * 51

      click_on "Submit"

      visit '/questions'

      expect(page).to have_content "Really, is this a legit question?"
      expect(page).to have_content "Is this a legit question?"
      expect(page.body.index("Really, is this a legit question?")).to be <
             page.body.index("Is this a legit question?") 
    end
  end
end
