class Game < ApplicationRecord
  GAME_STATES = %w(active completed paused)

  validates :status, inclusion: { in: GAME_STATES }

  belongs_to :user
  has_one :card

  def started?
    %w(completed paused).include? status
  end
end
