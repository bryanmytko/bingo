class Card < ApplicationRecord
  belongs_to :user

  before_create :generate_url

  private

  def generate_url
    self.url = SecureRandom.alphanumeric(10)
  end
end
