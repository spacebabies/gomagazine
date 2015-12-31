FactoryGirl.define do
  factory :article do
    articletype
    author
    
    trait :onhomepage do
      onhomepage true
    end
  end
end
