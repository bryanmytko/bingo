require "rails_helper"

describe "/", type: :request do
  let(:user) { User.create(email: "test@test.com", password: "abc123!") }

  describe "when the user is logged in" do
    before(:each) { sign_in user }

    it "is successful" do
      get "/"

      expect(response).to have_http_status(200)
    end

    it "renders the dashboard" do
      get "/"

      expect(response.body).to include("You are currently signed in as")
    end
  end

  describe "when the user is not logged in" do
    it "redirects to the login page" do
      get "/"

      expect(response).to have_http_status(302)
    end

    it "renders the login form" do
      get "/"
      follow_redirect!

      expect(response.body).to include("Login")
    end
  end
end
