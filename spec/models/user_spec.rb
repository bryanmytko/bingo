require "rails_helper"

describe User, type: :model do
  it "is invalid without an email" do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user = build(:user, password: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a valid password" do
    user = build(:user, password: "123")
    expect(user).not_to be_valid
  end
end
