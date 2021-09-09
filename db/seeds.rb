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

# ここからSchedules作成
# 50.times do |n|
#   Schedules.create!(
#     title: "タイトル#{n + 1}",
#     time: "20時start",
#     charge: "5000",
#     other: "サンプル",
#     image: File.open('./app/assets/images/test.png')
#     date: from = Date.today.beginning_of_month
#             to = Date.today.next_month.beginning_of_month
#           date = Schedule.where(date: from...to)
#   )
# end

    
# 50.times do |n|
#   User.create!(
#     name: name,
#     email: email,
#     password: password,
#     password_confirmation: password,
#     activated: true,
#     activated_at: Time.zone.now
#     birth_date: from = Time.parse("1950/01/01")
#     to = Time.parse("2000/01/01")
#     date = Random.rand(from..to)
#   )
# end



#     from = Date.today.beginning_of_month
#     to = Date.today.next_month.beginning_of_month
#     date = Schedule.where(date: from...to)