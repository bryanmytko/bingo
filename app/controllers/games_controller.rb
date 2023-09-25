class GamesController < ApplicationController
  def create
    @game = Game.find_or_create_by(user: current_user, card_id: params[:card_id])
    @game.update(status: :active)

    respond_to(&:turbo_stream)
  end

  def update
    @game = Game.find(params[:id])
    @game.update(params)

    respond_to(&:turbo_stream)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.complete!

    respond_to(&:turbo_stream)
  end

  private

  def game_params
    params.require(:game).permit(:card_id, :game, :id, :status)
  end
end
