# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def createProducts
	types = ["lowfat", "whole milk", "gourmet"]
	10.times do 
		flavor = Faker::Food.spice.split.first
		type1 = types.shuffle.first
		price = Faker::Number.decimal(2)
		Product.create(name: flavor, category: type1, price: price, numavailable: 40)
	end
end

createProducts