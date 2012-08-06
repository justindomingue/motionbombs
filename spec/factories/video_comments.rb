# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video_comment do
    user_id 1
    video_id 1
    content "MyText"
    mood 1
  end
end
