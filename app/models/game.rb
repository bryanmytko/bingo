class Game < ApplicationRecord
  GAME_STATES = %w[active completed paused].freeze

  validates :status, inclusion: { in: GAME_STATES }

  belongs_to :user
  belongs_to :card

  def active?
    %w[active].include? status
  end

  def started?
    %w[completed paused].include? status
  end

  def title
    card.title || ""
  end
end
