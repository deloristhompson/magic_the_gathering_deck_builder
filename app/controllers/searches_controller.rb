class SearchesController < ApplicationController
  include HTTParty
  base_uri 'https://api.magicthegathering.io/v1/cards?'

  def new
    @search = Search.new
    @color_collection = Color.all

  end

  def show
    @search = Search.find(params[:id])
  end

  def create
    @search = Search.new(search_params)
    if @search.save
      redirect_to @search
    else
      render :new
    end
  end
  # binding.pry
  # redirect_to @search

  private

  def search_params
    params.require(:search).permit(
      :name,
      :artist,
      :text,
      :mana_cost,
      :power,
      :toughness,
      :cmc,
      :type,
      :color,
      :rarity
    )
  end
end
