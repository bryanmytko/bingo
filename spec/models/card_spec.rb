require "rails_helper"

describe Card, type: :model do
  it "is invalid without a user" do
    card = Card.new
    expect(card).not_to be_valid
  end

  it "generates a url" do
    user = User.create(email: "a@b.com", password: "abc123!")
    card = Card.create(user: user)

    expect(card.url.size).to eql(10)
  end
end