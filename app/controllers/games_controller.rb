# frozen_string_literal: true

class GamesController < ApplicationController
  def create
    @game = Game.find_or_create_by(user: current_user, card_id: params[:card_id])
    @game.update(status: :active)

    render "pages/dashboard"
  end

  def destroy
    @game = Game.find(params[:id])
    @game.complete!

    render "pages/dashboard"
  end

  private

  def game_params
    params.require(:game).permit(:card_id, :game, :id, :status)
  end
end
