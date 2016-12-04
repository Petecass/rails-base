FactoryGirl.define do
  factory :identity do
    user
    provider { 'string' }
    uid { 'string' }
  end
end
