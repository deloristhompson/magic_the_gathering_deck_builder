require "rails_helper"

feature 'User search returns single card spec', %Q{
  As an unauthenticated user
  I want to search for a card
  So I can decide from the results if
  I want to become authenticated
} do
before(:all) do
  Rails.application.load_seed
end
  # Acceptance Criteria
  # * I must provide some information in the form
  # * If I provide the specified information
  #   I am redirected to the card index page
  #   for the exact card.

  let!(:angel_type) {FactoryBot.create(:type)}
  let!(:angel_card) {FactoryBot.create(:card)}
  let!(:elf_card) {FactoryBot.create(:card, name: "Elf", artist: "John")}

  scenario 'user searches by name' do
    visit '/'
    click_link 'Search for a Card'
    fill_in 'Name', with: 'Arcane'
    fill_in 'Artist', with: 'Jim Brown'
    click_button 'Search'

    expect(page).to have_content('Name: Arcane Angel')
    expect(page).to have_content('Artist: Jim Brown')
    expect(page).to have_content('Text: Arcane Angel has first strike')
    expect(page).to have_content('Mana Cost: {3}{W}{W}')
    expect(page).to have_content('CMC: 5')
    expect(page).to have_content('Power: 2')
    expect(page).to have_content('Toughness: 4')
  end

  scenario 'user searches by different name' do
    visit '/'
    click_link 'Search for a Card'
    fill_in 'Name', with: 'Elf'
    fill_in 'Artist', with: 'John'
    click_button 'Search'

    expect(page).to have_content('Name: Elf')
    expect(page).to_not have_content('Name: Arcane Angel')
  end

  scenario 'user searches by type' do
    visit '/'
    click_link 'Search for a Card'
    fill_in 'Type', with: 'Angel'
    click_button 'Search'

    expect(page).to have_content('Name: Arcane Angel')
    expect(page).to have_content('Artist: Jim Brown')
    expect(page).to have_content('Text: Arcane Angel has first strike')
    expect(page).to have_content('Mana Cost: {3}{W}{W}')
    expect(page).to have_content('Type: Angel')
  end

  scenario 'user searches by different type' do
    visit root_path
    click_link 'Search for a Card'
    fill_in 'Type', with: 'Elf'
    click_button 'Search'

    expect(page).to have_content('Name: Skyshroud Poacher')
    expect(page).to have_content('Name: Wellwisher')
  end
end
