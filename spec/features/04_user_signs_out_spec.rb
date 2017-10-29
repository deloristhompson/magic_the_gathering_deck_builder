require 'rails_helper'

feature 'User signs out', %Q{
  As an already authenticated user
  I want to sign out
  so that I can exit
} do
  # Acceptance Criteria
  #* I specify an email and password to sign in
  # * If I'm already signed in
  #   I don't have to sign in again.
  # * I want to sign out
  #  once I'm finished with my decks.

  scenario 'An existing user signs in' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content("Sign Out")
  end

  scenario 'an already authenticated user cannot re-sign in' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")

    visit new_user_session_path
    expect(page).to have_content("You are already signed in")
  end

  scenario 'an already authenticated user signs out' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")

    click_link 'Sign Out'
    expect(page).to have_content("Signed out successfully.")
  end
end
