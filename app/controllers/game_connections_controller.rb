class GameConnectionsController < ApplicationController
  def create
    @card = Card.find(params[:card])
    @game = Game.find_by(card: @card)

    @game_connection = GameConnection
      .find_or_create_by(user: current_user, game: @game)

    if @game_connection
      respond_to do |format|
        format.turbo_stream do
           render turbo_stream: [
            turbo_stream
              .update(
                "game-connection",
                partial: "cards/card",
                locals: { random_entries: @card.random_entries, game: @game }
              )
          ]
        end
      end
    end
  end

  private 

  def game_connections_params
    params.require(:game_connection).permit(:card)
  end
end
