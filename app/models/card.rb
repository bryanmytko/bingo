class Card < ApplicationRecord
  belongs_to :user
  has_one :game

  before_create :generate_url

  BINGO_CARD_SIZE = 25

  def random_entries
    entries
      .split(/[,,\n]/)
      .sample(BINGO_CARD_SIZE)
  end

  private

  def generate_url
    self.url = SecureRandom.alphanumeric(10)
  end
end
