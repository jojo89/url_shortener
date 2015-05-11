FactoryGirl.define do
  factory :link do
    original_url FactoryGirl.generate(:random_url)
  end
end
