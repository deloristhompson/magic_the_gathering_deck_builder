require 'rails_helper'


RSpec.describe Card, type: :model do
  it { should have_valid(:name).when('Arcane Angel', 'The Rack') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:artist).when('Arcane Angel', 'The Rack') }
  it { should_not have_valid(:artist).when(nil, '') }

  it { should have_valid(:text).when("Magic rules", 'Yay') }
  it { should_not have_valid(:text).when(nil, '') }

  it { should have_valid(:mana_cost).when('{5}{U}{R}') }
  it { should_not have_valid(:mana_cost).when(nil, '') }

  it { should have_valid(:power).when('5', '10') }
  it { should_not have_valid(:power).when(nil, '') }

  it { should have_valid(:toughness).when('5', '10') }
  it { should_not have_valid(:toughness).when(nil, '') }

  it { should have_valid(:cmc).when(4, 6) }
  it { should_not have_valid(:cmc).when(nil, '', 'five') }

  it { should have_many(:rarities) }
  it { should have_many(:colors) }
  it { should have_many(:types) }
  # it { should have_many(:sets) }
end

# it { should have_valid(:supertypes).when('Basic', 'Legendary') }
# it { should_not have_valid(:supertypes).when(nil, '', 'Trap', 'Red') }
#
# it { should have_valid(:subtypes).when('Trap', 'Arcane') }
# it { should_not have_valid(:subtypes).when(nil, '', 'Basic', 'Red') }
