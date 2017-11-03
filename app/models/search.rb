class Search < ApplicationRecord

  self.inheritance_column = :_type_disabled
  def cards
    @cards = find_cards
  end

  def types
    @types = find_types
  end

  def colors
    @colors = find_colors
  end

  private
  def find_types
    types = Type.order(:name)
    types = types.where("name LIKE ?", "%#{name}%") if name.present?
    types
  end

  def find_cards
    cards = Card.order(:name)
    cards = cards.where("name LIKE ?", "%#{name}%") if name.present?
    cards = cards.where("artist LIKE ?", "%#{artist}%") if artist.present?
    cards = cards.where("text LIKE ?", "%#{text}%") if text.present?
    cards = cards.where("mana_cost LIKE ?", "%#{mana_cost}%") if mana_cost.present?
    cards = cards.where("power LIKE ?", "%#{power}%") if power.present?
    cards = cards.where("toughness LIKE ?", "%#{toughness}%") if toughness.present?
    cards = cards.where("cmc LIKE ?", "%#{cmc}%") if cmc.present?
    cards = cards.limit(10)
    cards
  end

  def find_colors
    colors = Color.order(:name)
    colors = colors.where("name LIKE ?", "%#{name}%") if name.present?
    colors
  end
end
