require 'rails_helper'

RSpec.describe CompleteCard, type: :model do
  it { should belong_to :color }
  it { should belong_to :rarity }
  it { should belong_to :card }
  it { should belong_to :type }
end
