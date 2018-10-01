class Search < ApplicationRecord
  has_many :cards
  has_many :colors, through: :cards

  self.inheritance_column = :_type_disabled

  def cards
    @cards = find_cards
  end

  def card
    @card = find_card
  end

  def colors
    @colors = find_colors
  end

  private

  def find_cards
    cards = MTG::Card.where(name: name)
    .where(artist: artist)
    .where(text: text)
    .where(cmc: cmc)
    .where(power: power)
    .where(toughness: toughness.to_s)
    .where(colors: color)
    .where(rarity: rarity)
    .all
    return cards
  end

  def find_card
    card = Type.all
    card
  end
end
