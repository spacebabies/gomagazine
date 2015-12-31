FactoryGirl.define do
  factory :articletype do
    description { Faker::Name.name }
    intro { Faker::Name.name }
  end
end
