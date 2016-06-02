FactoryGirl.define do
  factory :user, class: User do
    sequence :email do |n|
      "kylolovesgrandpa#{n}@example.com"
    end
    password "finishwhatyoustarted"
    password_confirmation "finishwhatyoustarted"
  end
  
  factory :game do
    sith_user_id 1
    jedi_user_id 2
    association :sith_user
    association :jedi_user
  end

  factory :ship do
    name "starkiller base"
    vertical? true
    x_coordinate 3
    y_coordinate 4
    association :game
  end

end
