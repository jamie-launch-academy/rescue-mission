require 'rails_helper'

feature "User responds to a post", %q{
  As a user
  I want to answer another user's question
  So that I can help them solve their problem

  Acceptance Criteria

  - I must be on the question detail page
  - I must provide a description that is at least 50 characters long
  - I must be presented with errors if I fill out the form incorrectly} do

  scenario "Create a response with valid attributes" do
    visit '/questions/new'

    fill_in "Title", with: "Is this a legit question?"
    fill_in "Description", with: "I want to know if this is a legitamte
      question, do you think it is?"
    click_on "Submit"

    fill_in "Message", with: "I believe that's a real question. But the
      real question is, is this message at least 50 characters long?"

  end
end
