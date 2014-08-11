FactoryGirl.define do
  factory :map_route do
    from { "K" }
    to { "J" }
    distance { 10 }

    association :map
  end
end
