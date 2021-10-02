FactoryBot.define do
  factory :admin do
    email { Faker::Admin.email }
    encrypted_password { Faker::Admin.encrypted_password }
  end
end