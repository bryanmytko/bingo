class GamesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "GamesChannel"
  end
end
