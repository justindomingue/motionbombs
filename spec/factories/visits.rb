# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visit do
    video_id 1
    user_id 1
    ip "MyString"
    visits 1
  end
end
