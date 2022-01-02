class CardsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  BINGO_CARD_SIZE = 25.freeze

  def create
    @card = current_user.cards.create(card_params)

    redirect_to root_path
  end

  def show
    if params[:path]
      @card = Card.find_by(url: params[:path])
    else
      @card = Card.find(params[:id])
    end

    @entries = random_entries
  end

  def print
    if params[:path]
      @card = Card.find_by(url: params[:path])
    else
      @card = Card.find(params[:id])
    end

    @entries = random_entries
    render layout: "print"
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)

    redirect_to root_path
  end

  def destroy
    card = Card.find(params[:id])
    card.destroy 

    redirect_to root_path
  end

  private

  def card_params
    params.require(:card).permit(:title, :entries)
  end

  def random_entries
    entries = @card.entries
      .split(/[,\,\n]/)
      .sample(BINGO_CARD_SIZE)
  end
end
