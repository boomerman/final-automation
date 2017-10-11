FactoryGirl.define do
  factory :friendship do
    user nil
    friend nil
    user_roll 1
    friend_roll 1
    guide 1
    create "MyString"
    destroy "MyString"
  end
end
