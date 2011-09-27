require 'factory_girl'

Factory.define :user do |user|
  user.name                  "example"
  user.email                 "user@example.com"
  user.password              "foobarbaz"
  user.password_confirmation "foobarbaz"
end