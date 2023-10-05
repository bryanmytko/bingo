require "rails_helper"

describe Card, type: :model do
  it "is invalid without a user" do
    card = build(:card, user: nil)
    expect(card).not_to be_valid
  end

  it "generates a url" do
    card = create(:card)

    expect(card.url.size).to eql(10)
  end
end
