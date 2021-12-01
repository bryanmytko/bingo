class CardsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  BINGO_CARD_SIZE = 25.freeze

  def create
    @card = current_user.cards.create(card_params)

    # this should actually redirec to /hex or index page
    redirect_to @card
  end

  def show
    url =  params[:path]
    @card = Card.find_by(url: url)
    @entries = random_entries
    puts @entries
    # Neat CSS bingo card we can use?
    # https://codepen.io/oliviale/pen/OrxWyK
  end

  def update
  end

  def destroy
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
