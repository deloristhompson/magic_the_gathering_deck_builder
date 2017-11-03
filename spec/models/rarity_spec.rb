require 'rails_helper'

RSpec.describe Rarity, type: :model do
  it { should have_valid(:name).when('Rare', 'Common', 'Uncommon') }
  it { should_not have_valid(:name).when(nil, '') }
end
