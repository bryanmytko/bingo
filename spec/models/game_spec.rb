require "rails_helper"

describe Game, type: :model do
  it "is invalid without a status" do
    game = build(:game, status: nil)
    expect(game).not_to be_valid
  end

  it "is invalid without an allowed status" do
    game = build(:game, status: "foobar")
    expect(game).not_to be_valid
  end

  describe "when a game is completed" do
    it "sets the correct status" do
      game = create(:game, status: "active")
      game.complete!

      expect(game.status).to eql("completed")
    end

    it "removes all game connections" do
      game = create(:game, status: "active")
      create(:game_connection, game: game)
      game.complete!

      expect(GameConnection.count).to be(0)
    end
  end
end
