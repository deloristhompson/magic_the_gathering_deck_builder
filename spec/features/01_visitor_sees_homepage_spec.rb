require 'rails_helper'

# [] Visiting '/' should load a welcome page

feature 'User views homepage', %Q{
  As an unauthenticated User
  I want to view the homepage
} do
  # Acceptance Criteria
  # * I should see the welcome page
  # * I should have the option to sign up
    # * I should have the option to view
    #    a list of available sets/cards
    # * I should have the option to build a deck of cards

    scenario 'Visitor navigates to welcome index' do
      visit root_path
      expect(page).to have_content('Welcome to Magic The Gathering Deck Builder')
      expect(page).to have_link('Build a Deck')
      expect(page).to have_link('Search for a Card')
      expect(page).to have_link('Sign Up')
    end
end
