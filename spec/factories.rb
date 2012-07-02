FactoryGirl.define do
  factory :video do
    title       "Example title"
    description "Example long description"
    url         "http://www.youtube.com/watch?v=b6speA_XhP4"
    provider    "Youtube"
  end
  
  factory :formatted_video do
    title       "Example title"
    description "Example long description"
    thumb       "http://www.youtube.com/thumb.jpg"
    provider_video_id "F2S2F"
    provider    "youtube"
    views       "0"
    likes       "0"
  end
  
  factory :user do
    username    "username"
    password    "password"
    email       "example@domain.com"
  end
end