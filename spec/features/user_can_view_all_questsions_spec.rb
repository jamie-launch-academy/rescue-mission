# require 'rails_helper'
#
# feature "User can view all questsions" do
#   # As a user
#   # I want to view recently posted questions
#   # So that I can help others
#   #
#   # Acceptance Criteria
#   #
#   # - I must see the title of each question
#   # - I must see questions listed in order, most recently posted first
#
#   it "views all questions"
#     visit '/questions/new'
#
#     fill_in "Title", with: "Is this a legit question?"
#     fill_in "Description", with: "I want to know if this is a legitamte question"
#
#     click_on "Submit"
#
#     expect(page).to have_content "Question entered successfully!"
#     expect(page).to have_content "Is this a legit question?"
#     expect(page).to have_content "I want to know if this is a legitamte question"
#
#     visit '/questions'
#
#     expect(page).to have_content "Question entered successfully!"
#
# end
