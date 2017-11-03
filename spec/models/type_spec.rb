require 'rails_helper'

RSpec.describe Type, type: :model do
  it { should have_valid(:name).when('Arcane Angel', 'Elf') }
  it { should_not have_valid(:name).when('', nil) }
end
