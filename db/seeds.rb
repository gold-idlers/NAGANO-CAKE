# db/seeds.rb
Admin.find_or_create_by!(email_address: "admin@example.com") do |admin|
  admin.password = "password"
  admin.password_confirmation = "password"
end

# ジャンルのダミーデータ
genre1 = Genre.find_or_create_by!(name: "ケーキ")
genre2 = Genre.find_or_create_by!(name: "タルト")

# 商品のダミーデータ
Item.find_or_create_by!(name: "チョコバナナミルフィーユ") do |item|
  item.genre_id = genre1.id
  item.introduction = "チョコとバナナが絶妙なミルフィーユです"
  item.price = 1100
  item.is_active = true
end

Item.find_or_create_by!(name: "チーズタルト") do |item|
  item.genre_id = genre2.id
  item.introduction = "濃厚なチーズが楽しめるタルトです"
  item.price = 330
  item.is_active = true
end

# 顧客のダミーデータ
customer1 = Customer.find_or_create_by!(email_address: "test1@example.com") do |customer|
  customer.password = "password"
  customer.password_confirmation = "password"
  customer.last_name = "山田"
  customer.first_name = "花子"
  customer.last_name_kana = "ヤマダ"
  customer.first_name_kana = "ハナコ"
  customer.postal_code = "1500041"
  customer.address = "東京都渋谷区"
  customer.phone_number = "0368694700"
  customer.is_active = true
end

customer2 = Customer.find_or_create_by!(email_address: "test2@example.com") do |customer|
  customer.password = "password"
  customer.password_confirmation = "password"
  customer.last_name = "石倉"
  customer.first_name = "基之"
  customer.last_name_kana = "イシクラ"
  customer.first_name_kana = "モトユキ"
  customer.postal_code = "1600022"
  customer.address = "東京都新宿区"
  customer.phone_number = "0312345678"
  customer.is_active = true
end

# 注文のダミーデータ
item1 = Item.find_by!(name: "チョコバナナミルフィーユ")
item2 = Item.find_by!(name: "チーズタルト")

order1 = Order.find_or_create_by!(customer: customer1, created_at: "2019-11-20 14:22:19") do |order|
  order.postal_code = customer1.postal_code
  order.address = customer1.address
  order.name = "#{customer1.last_name} #{customer1.first_name}"
  order.payment_method = 0
  order.status = 0
  order.total_payment = 1100
  order.shopping_cost = 800
end

OrderDetail.find_or_create_by!(order: order1, item: item1) do |detail|
  detail.price = item1.price
  detail.amount = 8
  detail.making_status = 0
end

order2 = Order.find_or_create_by!(customer: customer2, created_at: "2019-11-20 23:55:12") do |order|
  order.postal_code = customer2.postal_code
  order.address = customer2.address
  order.name = "#{customer2.last_name} #{customer2.first_name}"
  order.payment_method = 0
  order.status = 0
  order.total_payment = 330
  order.shopping_cost = 800
end

OrderDetail.find_or_create_by!(order: order2, item: item2) do |detail|
  detail.price = item2.price
  detail.amount = 1
  detail.making_status = 0
end

# 3件目の注文データ
item1 = Item.find_by!(name: "チョコバナナミルフィーユ")

customer1 = Customer.find_by!(email_address: "test1@example.com")

order3 = Order.create!(
  customer: customer1,
  postal_code: customer1.postal_code,
  address: customer1.address,
  name: "#{customer1.last_name} #{customer1.first_name}",
  payment_method: 0,
  status: 0,
  shopping_cost: 800,
  total_payment: 1600
)

OrderDetail.create!(
  order: order3,
  item: item1,
  price: item1.price,
  amount: 1,
  making_status: 0
)
