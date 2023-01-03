require "rails_helper"

describe "/cards", type: :request do
  let(:user) { User.create(email: "test@test.com", password: "abc123!") }

  describe "POST /create" do
    before(:each) { sign_in user }

    describe "when the user is logged in" do
      it "creates a new card" do
        card = { title: "foo", entries: ["foo", "bar"] }

        expect {
          post cards_url, params: { card: card }
        }.to change(Card, :count).by(1)
      end
    end
  end
end