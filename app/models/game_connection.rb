# frozen_string_literal: true

class GameConnection < ApplicationRecord
  after_create_commit { broadcast_connected }
  belongs_to :user
  belongs_to :game

  private

  def broadcast_connected
    ActionCable.server.broadcast("GamesChannel", { id: id, user: user })
  end
end
