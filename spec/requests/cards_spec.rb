require "rails_helper"

describe "/cards", type: :request do
  let(:user) { User.create(email: "test@test.com", password: "abc123!") }

  describe "POST /create" do
    let(:card) {{ title: "foo", entries: ["foo", "bar"] }}

    describe "when the user is logged in" do
      before(:each) { sign_in user }

      it "creates a new card" do
        expect { post cards_url, params: { card: card }}
          .to change(Card, :count).by(1)
      end
    end

    describe "when the user is not logged in" do
      it "redirects to the login page" do
        post cards_url, params: { card: card }

        expect(response).to have_http_status(302)
      end
    end
  end

  describe "GET /:id" do
    it "shows the card" do
      card = Card.create!(user: user, entries: ["foo", "bar"])
      response = get "/cards/#{card.id}"

      expect(response).to be(200)
    end

    describe "with the path param" do
      it "shows the card" do
        card = Card.create!(user: user, entries: ["foo", "bar"])
        response = get "/#{card.url}"

        expect(response).to be(200)
      end
    end
  end

  describe "GET /print/:id" do
    describe "with the path param" do
      it "shows the card" do
        card = Card.create!(user: user, entries: ["foo", "bar"])
        response = get "/print/#{card.url}"
  
        expect(response).to be(200)
      end
    end
  end

  describe "GET /cards/:id/edit" do
    describe "when the user is logged in" do
      before(:each) { sign_in user }

      it "shows the edit page" do
        card = Card.create!(user: user)
        response = get "/cards/#{card.id}/edit"

        expect(response).to be(200)
      end
    end

    describe "when the user is not logged" do
      it "redirects to the login screen" do
        card = Card.create!(user: user)
        response = get "/cards/#{card.id}/edit"

        expect(response).to be(302)
      end
    end
  end

  describe "PUT /cards/:id" do
    describe "when the user is logged in" do
      before(:each) { sign_in user }

      it "updates the card" do
        card = Card.create!(title: "foo", user: user)
        put "/cards/#{card.id}", params: {
          card: {
            title: "foo2"
          }
        }
        editedCard = Card.find(card.id)

        expect(editedCard.title).to eq("foo2")
      end
    end

    describe "when the user is not logged" do
      it "redirects to the login screen" do
        card = Card.create!(title: "foo", user: user)
        response = put "/cards/#{card.id}", params: {
          card: {
            title: "foo2"
          }
        }
        editedCard = Card.find(card.id)

        expect(editedCard.title).to eq(card.title)
        expect(response).to be(302)
      end
    end
  end

  describe "DELETE /:id" do
    describe "when the user is logged in" do
      before(:each) { sign_in user }

      it "deletes the card" do
        card = Card.create!(user: user)

        expect {
          delete "/cards/#{card.id}"
        }.to change(Card, :count).by(-1)
      end

      it "redirects to the home screen" do
        card = Card.create!(user: user)
        response = delete "/cards/#{card.id}"

        expect(response).to be(302)
      end

      describe "when the card does not exist" do
        before(:each) { sign_in user }

        it "redirects to the home screen" do
          response = delete "/cards/1"

          expect(response).to be(302)
        end
      end
    end

    describe "when the user is not logged" do
      it "does not delete the card" do
        card = Card.create!(user: user)
        response = delete "/cards/#{card.id}"

        expect {
          delete "/cards/#{card.id}"
        }.to change(Card, :count).by(0)
      end

      it "redirects to the home screen" do
        card = Card.create!(user: user)
        response = delete "/cards/#{card.id}"

        expect(response).to be(302)
      end
    end
  end
end
