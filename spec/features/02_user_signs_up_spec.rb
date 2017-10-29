require 'rails_helper'

feature 'User signs up', %Q{
  As an unauthenticated user
  I want to sign up
  So that I can save a deck.
} do
  # Acceptance Criteri
  # * I must specify a valid email address
  # * I must specify a password and confirm that password
  # * If I do not perform the above, I receive an error message.
  # * If I specify valid information, I register my account.

  scenario 'Specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Deloris'
    fill_in 'Last Name', with: 'Snow'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_content("You're In!")
    expect(page).to have_content('Sign Out')
  end

  scenario 'Required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
  end

  scenario 'Password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'somethingDifferent'
    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end
end
