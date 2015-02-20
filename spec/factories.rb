FactoryGirl.define do
  factory :user do
    email    "t1@test.com"
    password "foo"
    password_confirmation "foo"
  end
end