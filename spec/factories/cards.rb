FactoryBot.define do
  factory :card do
    name 'Arcane Angel'
    artist 'Jim Brown'
    text 'Arcane Angel has first strike'
    mana_cost '{3}{W}{W}'
    cmc '5'
    power '2'
    toughness '4'
  end
end
