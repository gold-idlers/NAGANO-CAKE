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
