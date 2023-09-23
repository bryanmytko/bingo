class GamesController < ApplicationController
  def create
    @game = Game.find_or_create_by(user: current_user, card_id: params[:card_id])
    @game.update(status: :active)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update("buttons-#{params[:card_id]}", partial: "games/buttons", locals: { card: @game.card }),
          turbo_stream.update("game-dashboard", partial: "games/dashboard", locals: { game: @game })
        ]
      end
    end
  end

  def update
    #TODO refactor
    game = Game.find(params[:id])
    game.update(status: params[:status])
    # game.connections.destroy_all

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update("buttons-#{game.card.id}", partial: "games/buttons", locals: { card: game.card }),
          turbo_stream.update("game-dashboard", partial: "games/dashboard", locals: { game: game })
        ]
      end
    end
  end

  private

  def game_params
    params.require(:game).permit(:card_id, :game, :id, :status)
  end
end
