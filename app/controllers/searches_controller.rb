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
    Color.where(id: params[:search][:color_ids]).each do |color|
      @search.color = color.name
    end
    if @search.save
      redirect_to @search
    else
      render :new
    end
  end

  private

  def search_params
    params.require(:search).permit(
      :name,
      :artist,
      :power,
      :toughness,
      :text,
      :cmc,
      :mana_cost,
      :type,
      :color,
      :rarity
    )
  end
end
