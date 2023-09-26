# frozen_string_literal: true

module ApplicationHelper
  def current_user_cards
    current_user&.cards
  end
end
