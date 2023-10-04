# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    user
  end

  factory :game do
    card
    status { "active" }
    user
  end

  factory :game_connection do
    game
    user
  end

  factory :user do
    sequence(:email) { |n| "foo#{n}@website.com" }
    password { "p@ssword123!" }
  end
end
