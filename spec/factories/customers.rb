FactoryBot.define do
  factory :customer do #factory :testcustomer, class: Customer do のようにクラスを明示すればモデル名以外のデータも作れます
    name { Faker::Customer.name }
    name_kana { Faker::Customer.name_kana }
    email { Faker::Customer.email }
    postal_cord { Faker::Customer.postal_cord }
    address { Faker::Customer.address }
    telephone_number { Faker::Customer.telephone_number }
    memo { Faker::Customer.memo }
    is_deleted { Faker::Customer.is_deleted }
  end
end
