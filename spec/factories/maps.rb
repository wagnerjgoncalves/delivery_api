FactoryGirl.define do
  factory :map do
    sequence(:name) { |n| "Map #{n}" }

    after(:create) do |object|
      create(:map_route, from: "A", to: "B", distance: 10, map: object)
      create(:map_route, from: "B", to: "D", distance: 15, map: object)
      create(:map_route, from: "A", to: "C", distance: 20, map: object)
      create(:map_route, from: "C", to: "D", distance: 30, map: object)
      create(:map_route, from: "B", to: "E", distance: 50, map: object)
      create(:map_route, from: "D", to: "E", distance: 30, map: object)
    end
  end
end
