require 'rails_helper'

RSpec.describe Color, type: :model do
  it { should have_valid(:name).when('Blue', 'Red') }
  it { should_not have_valid(:name).when(nil, '') }
  
  it "Contains colors" do
    color = Color.create(name: 'Blue')
    expect(color.name).to eq('Blue')
  end
end
