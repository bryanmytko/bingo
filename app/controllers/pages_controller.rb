class PagesController < ApplicationController
  def dashboard
    @cards = Card.where(user: current_user)
    @game = Game.find_by(user: current_user, status: "active")
  end
end
