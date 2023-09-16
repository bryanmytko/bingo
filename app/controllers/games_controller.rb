class GamesController < ApplicationController
  def create
    @game = Game.find_or_create_by(user: current_user, card_id: params[:card])
    @game.update(status: :active) unless @game.started?

    @game

    respond_to do |format|
      format.turbo_stream { render :create }
    end
  end

  private 

  def game_params
    params.require(:game).permit(:card)
  end
end
