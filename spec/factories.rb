require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name                  "example"
    email                 "user@example.com"
    password              "foobarbaz"
    password_confirmation "foobarbaz"
  end
end