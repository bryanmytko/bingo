class GamesController < ApplicationController
  def create
    card_id = params[:card]
    @game = Game.find_or_create_by(user: current_user, card_id: card_id)
    @game.update(status: :active) unless @game.started?

    respond_to do |format|
      format.turbo_stream do
         render turbo_stream: [
          turbo_stream.update("buttons-#{card_id}", partial: "games/buttons"),
          turbo_stream.update("game-dashboard", partial: "games/dashboard", locals: { game: @game })
        ]
      end
    end
  end

  def update
    game = Game.find(params[:game])
    game.update(status: params[:status])
  end

  private 

  def game_params
    params.require(:game).permit(:card, :game, :status)
  end
end
