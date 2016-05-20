FactoryGirl.define do
  factory :ship do
    name "starkiller base"
    vertical? true
    x_coordinate 3
    y_coordinate 4
    association :user
    association :game
  end
end
