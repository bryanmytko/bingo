class CardsController < ApplicationController
  def create
    @card = current_user.cards.create(card_params)

    # this should actually redirec to /hex or index page
    redirect_to @card
  end

  def show
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
end
