class Rarity < ApplicationRecord
  validates_presence_of :name
  has_many :cards
end
