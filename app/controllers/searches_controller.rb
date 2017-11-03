class SearchesController < ApplicationController
  def index


  end

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
  # @cards = Card.where("artist LIKE ?", "%#{params[:card]}%")
  # @cards = Card.where("text LIKE ?", "%#{params[:card]}%")
  # @cards = Card.where("mana_cost LIKE ?", "%#{params[:card]}%")
  # @cards = Card.where("cmc LIKE ?", "%#{params[:card]}%")
  # @cards = Card.where("power LIKE ?", "%#{params[:card]}%")
  # @cards = Card.where("toughness LIKE ?", "%#{params[:card_toughness]}%")
end
