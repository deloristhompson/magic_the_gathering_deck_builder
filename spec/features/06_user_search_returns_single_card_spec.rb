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
  let!(:new_type) {FactoryBot.create(:type, name: "Elf")}

  let!(:elf_type) {
    FactoryBot.create(:card,
    name: "Skyshroud Poacher",
    artist: 'Ron Spencer',
    text: 'Search your library for and Elf card
    and put that card into play.
    Then shuffle your library.',
    mana_cost: '{2}{G}{G}',
    cmc: '4',
    power: '2',
    toughness: '2',
    type: new_type
    )
  }

  let!(:angel_card) {FactoryBot.create(:card)}
  let!(:elf_card) {FactoryBot.create(:card, name: "Elf", artist: "John", type: new_type)}
  let!(:wrong_card) {FactoryBot.create(:card, name: "Ryders", artist: "Jim Brown")}
  let!(:uncommon) {FactoryBot.create(:rarity, name: "Rare")}
  let!(:wish_card) {
    FactoryBot.create(:card,
      name: "Wellwisher",
      artist: 'Christopher Rush',
      text: 'You gain 1 life for each Elf in play.',
      mana_cost: '{1}{G}',
      cmc: '2',
      power: '1',
      toughness: '1',
      rarity: uncommon,
      type: new_type
    )
  }

  scenario 'user searches by name' do
    visit '/'
    click_link 'Search for a Card'
    fill_in 'Name', with: 'Arcane Savant'
    fill_in 'Artist', with: 'Jim Brown'
    click_button 'Search'

    expect(page).to have_content('Name: Arcane Savant')
    expect(page).to have_content('Artist: Chris Rallis')
    expect(page).to have_content('Text: Before y')
    expect(page).to have_content('Mana Cost: {3}{W}{W}')
    expect(page).to have_content('CMC: 5')
    expect(page).to have_content('Power: 2')
    expect(page).to have_content('Rarity: Common')
    expect(page).to have_content('Type: Angel')
    expect(page).to have_content('Color: Blue')
    expect(page).to have_content('Toughness: 4')

    expect(page).to_not have_content('Name: Ryders')
  end

  scenario 'user searches by different name' do
    visit '/'
    click_link 'Search for a Card'
    fill_in 'Name', with: 'Ryders'
    fill_in 'Artist', with: 'Jim Brown'
    click_button 'Search'

    expect(page).to have_content('Name: Ryders')
    expect(page).to_not have_content('Name: Arcane Angel')
    expect(page).to_not have_content('Name: Elf')
  end

  scenario 'user searches by artist' do
    visit root_path
    click_link 'Search for a Card'
    fill_in 'Artist', with: 'Jim Brown'
    click_button 'Search'

    expect(page).to have_content('Name: Arcane Angel')
    expect(page).to have_content('Name: Ryders')
    expect(page).to_not have_content('Name: Wellwisher')
  end

  scenario 'user searches by rarity' do
    visit root_path
    click_link 'Search for a Card'
    fill_in 'Rarity', with: 'Common'
    click_button 'Search'

    expect(page).to have_content('Name: Arcane Angel')
    expect(page).to_not have_content('Name: Wellwisher')
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
