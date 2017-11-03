class Card < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :artist
  validates_presence_of :text
  validates_presence_of :mana_cost
  validates_presence_of :power
  validates_presence_of :toughness
  validates :cmc, presence: true, numericality: { only_integer: true }

  has_many :complete_cards
  has_many :colors, through: :complete_cards
  has_many :rarities
  has_many :types, through: :complete_cards
end
