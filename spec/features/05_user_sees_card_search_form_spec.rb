require "rails_helper"

feature 'User sees card search form', %Q{
  As a MTG card player
  I want to search for a card
  So that I find out more about it.
} do

  # [] Visiting the cards_path should show a form for a card

  scenario 'user selects Search for a Card' do
    visit '/'
    click_link 'Search for a Card'

    expect(page).to have_current_path(new_search_path)
  end

  scenario 'user views cards search form' do
    visit '/'
    click_link 'Search for a Card'

    expect(page).to have_content('Search for a Card')
    expect(page).to have_content('Name:')
    expect(page).to have_content('Artist:')
    expect(page).to have_content('Type:')
    expect(page).to have_content('Colors:')
    expect(page).to have_content('Text:')
    expect(page).to have_content('Power:')

    expect(page).to have_content('Toughness:')
    expect(page).to have_content('CMC:')
    expect(page).to have_content('Mana Cost:')
    expect(page).to have_content('Rarity:')
    # expect(page).to have_content('SubType:')
    # expect(page).to have_content('SuperType:')

    expect(page).to have_button('Search')
  end

  scenario 'user goes to search form directly' do
    visit new_search_path
    expect(page).to have_content('Search for a Card')
  end
end
