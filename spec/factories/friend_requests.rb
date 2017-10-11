FactoryGirl.define do
  factory :friend_request do
    user nil
    friend nil
    accepted false
    rejected false
    pending false
    sender_roll_no 1
    friend_roll_no 1
  end
end
