require "rails_helper"

describe Game, type: :model do
  let(:card) { Card.create!(user: user) }
  let(:user) { User.create(email: "test@test.com", password: "foobar123") }

  it "is invalid without a status" do
    game = Game.new(card: card)
    expect(game).not_to be_valid
  end

  it "is invalid without an allowed status" do
    game = Game.new(card: card, status: "foobar")
    expect(game).not_to be_valid
  end

  context "when a game is completed" do
    it "sets the correct status" do
      game = Game.create(card: card, status: "active", user: user)
      game.complete!

      expect(game.status).to eql("completed")
    end

    it "removes all game connections" do
      game = Game.create(card: card, status: "active", user: user)
      GameConnection.create(game: game, user: user)
      game.complete!

      expect(GameConnection.all).to be_empty
    end
  end
end
