# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~ターミナルで"rails db:reset"で使用~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ここからAdminアカウント作成
Admin.create!(
  email: "test@test",
  password: "test@test"
)

# # ここからCustomerアカウント作成
# 5.times do |number|
#   Customers.create!(
#     name: "氏名#{number + 1}",
#     name_kana: "シメイ",
#     email: "test@test#{number + 1}",
#     postal_cord: "0000000",
#     address: "住所#{number + 1}",
#     telephone_number: "0000000000#{number + 1}",
#     password: "test@test#{number + 1}",
#   )
# end
