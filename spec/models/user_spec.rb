require "rails_helper"

describe User, type: :model do
  it "is invalid without an email" do
    user = User.create
    expect(user.errors.messages_for(:email)[0]).to match(/blank/)
  end

  it "is invalid without a password" do
    user = User.create
    expect(user.errors.messages_for(:password)[0]).to match(/blank/)
  end

  it "is invalid without a valid password" do
    user = User.create(password: "1")
    expect(user.errors.messages_for(:password)[0]).to match(/short/)
  end
end