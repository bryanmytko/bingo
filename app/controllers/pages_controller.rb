class PagesController < ApplicationController
  def home
    @cards = Card.where(user: current_user)
  end
end
