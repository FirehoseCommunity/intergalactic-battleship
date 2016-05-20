FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "kylolovesgrandpa#{n}@example.com"
    end
    password "finishwhatyoustarted"
    password_confirmation "finishwhatyoustarted"
  end
end
