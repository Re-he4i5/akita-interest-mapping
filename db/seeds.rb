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

CSV.foreach("db/initial_data/category.csv", headers: false) do |row|
    Category.find_or_create_by!(id: row[0]) do |category|
        category.name = row[1]
    end
end