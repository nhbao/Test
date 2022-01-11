FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    tax { Faker::Number.between(from: 0, to: 10) }
  end
end
