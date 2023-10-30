# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by!(email: "test@test.com") do |admin|
    admin.password = "testtest"
end

require "csv"
CSV.foreach("db/initial_data/town.csv", headers: false) do |row|
    Town.find_or_create_by!(id: row[0]) do |town|
        town.name = row[3]
    end
end

CSV.foreach("db/initial_data/category.csv") do |row|
    Category.find_or_create_by!(id: row[0]) do |category|
        category.name = row[1]
    end
end

users_data = [
    {email: "suzuki@test.com", password: "password123", last_name: "鈴木", first_name: "一郎", last_name_kana: "スズキ", first_name_kana: "イチロウ", nickname: "イチ"},
    {email: "tanaka@test.com", password: "tanaka2023", last_name: "田中", first_name: "美咲", last_name_kana: "タナカ", first_name_kana: "ミサキ", nickname: "ミサ"},
    {email: "yamamoto@test.com", password: "yamamoto88", last_name: "山本", first_name: "太郎", last_name_kana: "ヤマモト", first_name_kana: "タロウ", nickname: "タロ"},
    {email: "watanabe@test.com", password: "watanabe2023", last_name: "渡辺", first_name: "直人", last_name_kana: "ワタナベ", first_name_kana: "ナオト", nickname: "ナオ"},
    {email: "ito@test.com", password: "itoSecure123", last_name: "伊藤", first_name: "恵", last_name_kana: "イトウ", first_name_kana: "メグミ", nickname: "メグ"},
    {email: "sato@test.com", password: "satoPassword", last_name: "佐藤", first_name: "雅也", last_name_kana: "サトウ", first_name_kana: "マサヤ", nickname: "マサ"},
    {email: "kobayashi@test.com", password: "koba2023", last_name: "小林", first_name: "純一", last_name_kana: "コバヤシ", first_name_kana: "ジュンイチ", nickname: "ジュン"}
]

users = users_data.map do |user_data|
    User.find_or_create_by!(email: user_data[:email]) do |user|
    user.password = user_data[:password]
    user.last_name = user_data[:last_name]
    user.first_name = user_data[:first_name]
    user.last_name_kana = user_data[:last_name_kana]
    user.first_name_kana = user_data[:first_name_kana]
    user.nickname = user_data[:nickname]
    end
end

Post.create!(
    [
        {user_id: "1", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/initial_data/7A0A481B-2AE9-4586-98A2-373A8321298F.JPG"), filename:"7A0A481B-2AE9-4586-98A2-373A8321298F.JPG"),town_id: "12",category_id: "3",title: "元滝伏流水",body: "個人的ベスト避暑地です！"},
        {user_id: "2", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/initial_data/DSC00154.JPEG"), filename:"DSC00154.JPEG"),town_id: "7",category_id: "7",title: "雲昌寺でみつけた！",body: "鼻水が出てるみたいでかわいかったです！"},
        {user_id: "3", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/initial_data/DSC00163.JPG"), filename:"DSC00163.JPG"),town_id: "7",category_id: "9",title: "雲昌寺",body: "紫陽花きれいでした！"},
        {user_id: "4", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/initial_data/DSC00637.jpg"), filename:"DSC00637.jpg"),town_id: "19",category_id: "3",title: "ねこばりいわ",body: "自然の中で癒されました！"},
        {user_id: "5", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/initial_data/DSC00697.JPG"), filename:"DSC00697.JPG"),town_id: "10",category_id: "6",title: "大曲の花火",body: "iPhoneで撮りました！"},
        {user_id: "6", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/initial_data/DSC00765.JPG"), filename:"DSC00765.JPG"),town_id: "10",category_id: "7",title: "大曲の花火",body: "彼氏と行きました！"},
        {user_id: "7", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/initial_data/DSC00787.JPG"), filename:"DSC00787.JPG"),town_id: "10",category_id: "6",title: "大曲の花火のフィナーレ！",body: "今年は雨が振らなくてよかったです！"},
        {user_id: "7",image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/initial_data/DSC02653.JPEG"), filename:"DSC02653.JPEG"),town_id: "7",category_id: "3",title: "雲昌寺のあじさい",body: "オールドレンズで撮りました！"},
        {user_id: "7",image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/initial_data/DSC02663.JPEG"), filename:"DSC02663.JPEG"),town_id: "7",category_id: "9",title: "雲昌寺のあじさい",body: "今年も行きました！"},
    ]
)