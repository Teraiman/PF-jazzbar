FactoryBot.define do
  factory :customer do #factory :testcustomer, class: Customer do のようにクラスを明示すればモデル名以外のデータも作れます
    name { "Spec太郎" }
    name_kana { "スペックタロウ" }
    email { "spec@example.com" }
    postal_cord { "1234567" }
    address { "住所県住所市" }
    telephone_number { "09012345678" }
    memo { "ボトルキープ" }
    is_deleted { "true" }
    password { "000000" }
  end
end
