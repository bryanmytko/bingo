require "rails_helper"

describe GameConnection, type: :model do
  let(:game) { Game.create!(status: "active", user: user, card: card) }
  let(:card) { Card.create!(user: user) }
  let(:user) { User.create(email: "test@test.com", password: "foobar123") }

  it "is invalid without a user" do
    game_connection = GameConnection.new(game: game)
    expect(game_connection).not_to be_valid
  end

  it "is invalid without a game" do
    game_connection = GameConnection.new(user: user)
    expect(game_connection).not_to be_valid
  end

  it "broadcasts to the GamesChannel on create" do
    game_connection = GameConnection.new(game: game, user: user)

    expect { game_connection.save }
      .to have_broadcasted_to("GamesChannel").exactly(:once)
  end
end
