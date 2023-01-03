require "rails_helper"

describe "/cards", type: :request do
  let(:user) { User.create(email: "test@test.com", password: "abc123!") }

  describe "POST /create" do
    before(:each) { sign_in user }
    let(:card) {{ title: "foo", entries: ["foo", "bar"] }}

    describe "when the user is logged in" do
      it "creates a new card" do

        expect {
          post cards_url, params: { card: card }
        }.to change(Card, :count).by(1)
      end
    end

    describe "when the user is not logged in" do
      it "redirects to the login page" do
        post cards_url, params: { card: card }

        expect(response).to have_http_status(302)
      end
    end
  end
end
