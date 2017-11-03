class CardsController < ApplicationController
  def index
    @cards = Card.all
    @color_collection = Color.all
    binding.pry
  end

  def new
    @card = Card.new
  end

  def card_params
    params.require(:card).permit(
      :name,
      :artist,
      :text,
      :mana_cost,
      :cmc,
      :power,
      :toughness,
      :created_at)
  end
end
