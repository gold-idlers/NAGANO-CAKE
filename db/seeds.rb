require "open-uri"

# 管理者
Admin.find_or_create_by!(email_address: "admin@example.com") do |admin|
  admin.password = "password"
  admin.password_confirmation = "password"
end

# ジャンル
genre1 = Genre.find_or_create_by!(name: "ケーキ")
genre2 = Genre.find_or_create_by!(name: "タルト")
genre3 = Genre.find_or_create_by!(name: "クッキー")
genre4 = Genre.find_or_create_by!(name: "プリン")
genre5 = Genre.find_or_create_by!(name: "マカロン")

# 商品
items_data = [
  { name: "チョコバナナミルフィーユ", genre: genre1, introduction: "チョコとバナナが絶妙なミルフィーユです", price: 1100, image_url: "https://images.unsplash.com/photo-1660485039693-723b9f53b649?q=80&w=985&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "チーズタルト", genre: genre2, introduction: "濃厚なチーズが楽しめるタルトです", price: 330, image_url: "https://images.unsplash.com/photo-1719599791611-e78d3fa3e59a?q=80&w=300" },
  { name: "苺ショートケーキ", genre: genre1, introduction: "ふわふわスポンジに甘い苺がたっぷり", price: 880, image_url: "https://images.unsplash.com/photo-1774689407321-7b0ff1c77f85?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "洋梨のチーズタルト", genre: genre2, introduction: "洋梨の甘さとチーズの濃厚さが絶品", price: 1200, image_url: "https://images.unsplash.com/photo-1687619485467-144aa3c7752e?q=80&w=1035&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "抹茶ロールケーキ", genre: genre1, introduction: "国産抹茶を使ったロールケーキです", price: 950, image_url: "https://images.unsplash.com/photo-1627308592814-f88b68f7b4a1?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "アーモンドクッキー", genre: genre3, introduction: "サクサクのアーモンドクッキーです", price: 450, image_url: "https://images.unsplash.com/photo-1593759608179-014a7dec4e7f?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "チョコクッキー", genre: genre3, introduction: "濃厚なチョコレートクッキーです", price: 380, image_url: "https://images.unsplash.com/photo-1664339030031-176a7e4d1a4c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "なめらかプリン", genre: genre4, introduction: "口どけなめらかなプリンです", price: 200, image_url: "https://images.unsplash.com/photo-1702728052103-69473aa7ed77?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "特製ガトーショコラ", genre: genre1, introduction: "濃厚チョコレートのガトーショコラ", price: 2500, image_url: "https://images.unsplash.com/photo-1606313564200-e75d5e30476c?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "マカロンセット（8個）", genre: genre5, introduction: "カラフルなマカロンが8個入ったセット", price: 1200, image_url: "https://images.unsplash.com/photo-1634118520179-0c78b72df69a?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" }
]

items_data.each do |data|
  item = Item.find_or_create_by!(name: data[:name]) do |i|
    i.genre = data[:genre]
    i.introduction = data[:introduction]
    i.price = data[:price]
    i.is_active = true
  end

  unless item.image.attached?
    item.image.attach(
      io: URI.open(data[:image_url]),
      filename: "#{item.name}.jpg",
      content_type: "image/jpeg"
    )
  end
end

# 顧客
customers_data = [
  { email: "test1@example.com", last_name: "山田", first_name: "花子", last_name_kana: "ヤマダ", first_name_kana: "ハナコ", postal_code: "1500041", address: "東京都渋谷区神南1丁目19-11", phone_number: "0368694700" },
  { email: "test2@example.com", last_name: "石倉", first_name: "基之", last_name_kana: "イシクラ", first_name_kana: "モトユキ", postal_code: "1600022", address: "東京都新宿区新宿3丁目1-1", phone_number: "0312345678" },
  { email: "test3@example.com", last_name: "佐藤", first_name: "太郎", last_name_kana: "サトウ", first_name_kana: "タロウ", postal_code: "2310023", address: "神奈川県横浜市中区山下町1-1", phone_number: "0451234567" },
  { email: "test4@example.com", last_name: "鈴木", first_name: "美咲", last_name_kana: "スズキ", first_name_kana: "ミサキ", postal_code: "0600001", address: "北海道札幌市中央区北1条西2丁目", phone_number: "0111234567" },
  { email: "test5@example.com", last_name: "田中", first_name: "健一", last_name_kana: "タナカ", first_name_kana: "ケンイチ", postal_code: "5300001", address: "大阪府大阪市北区梅田1丁目1-1", phone_number: "0661234567" }
]

customers = customers_data.map do |data|
  Customer.find_or_create_by!(email_address: data[:email]) do |c|
    c.password = "password"
    c.password_confirmation = "password"
    c.last_name = data[:last_name]
    c.first_name = data[:first_name]
    c.last_name_kana = data[:last_name_kana]
    c.first_name_kana = data[:first_name_kana]
    c.postal_code = data[:postal_code]
    c.address = data[:address]
    c.phone_number = data[:phone_number]
    c.is_active = true
  end
end

# 配送先
addresses_data = [
  { customer: customers[0], postal_code: "1050011", address: "東京都港区芝公園4丁目2-8", name: "山田 花子" },
  { customer: customers[0], postal_code: "1600023", address: "東京都新宿区西新宿1丁目1-1", name: "山田 花子" },
  { customer: customers[1], postal_code: "2210835", address: "神奈川県横浜市神奈川区鶴屋町2丁目1-1", name: "石倉 基之" },
  { customer: customers[2], postal_code: "1500001", address: "東京都渋谷区神宮前1丁目1-1", name: "佐藤 太郎" }
]

addresses_data.each do |data|
  Address.find_or_create_by!(customer: data[:customer], address: data[:address]) do |a|
    a.postal_code = data[:postal_code]
    a.name = data[:name]
  end
end

# 注文
items = Item.all.to_a

orders_data = [
  { customer: customers[0], created_at: "2019-11-20 14:22:19", payment_method: 0, status: 2, details: [ { item: items[0], amount: 8 }, { item: items[1], amount: 4 } ] },
  { customer: customers[1], created_at: "2019-11-20 23:55:12", payment_method: 1, status: 1, details: [ { item: items[2], amount: 1 }, { item: items[3], amount: 2 } ] },
  { customer: customers[0], created_at: "2020-01-05 10:30:00", payment_method: 0, status: 3, details: [ { item: items[4], amount: 2 } ] },
  { customer: customers[2], created_at: "2020-02-14 18:00:00", payment_method: 1, status: 0, details: [ { item: items[5], amount: 3 }, { item: items[6], amount: 2 } ] },
  { customer: customers[3], created_at: "2020-03-01 09:00:00", payment_method: 0, status: 1, details: [ { item: items[7], amount: 5 }, { item: items[8], amount: 1 } ] },
  { customer: customers[4], created_at: "2020-03-15 14:00:00", payment_method: 1, status: 0, details: [ { item: items[9], amount: 2 } ] },
  { customer: customers[1], created_at: "2020-04-01 11:00:00", payment_method: 0, status: 2, details: [ { item: items[0], amount: 1 }, { item: items[7], amount: 3 } ] },
  { customer: customers[2], created_at: "2020-04-10 16:00:00", payment_method: 1, status: 3, details: [ { item: items[2], amount: 2 }, { item: items[9], amount: 1 } ] }
]

orders_data.each do |data|
  order = Order.create!(
    customer: data[:customer],
    postal_code: data[:customer].postal_code,
    address: data[:customer].address,
    name: "#{data[:customer].last_name} #{data[:customer].first_name}",
    payment_method: data[:payment_method],
    status: data[:status],
    shopping_cost: 800,
    total_payment: data[:details].sum { |d| (d[:item].price * 1.1).ceil * d[:amount] } + 800,
    created_at: data[:created_at]
  )

  data[:details].each do |detail|
    OrderDetail.create!(
      order: order,
      item: detail[:item],
      price: detail[:item].price,
      amount: detail[:amount],
      making_status: 0
    )
  end
end

puts "seed完了！"
