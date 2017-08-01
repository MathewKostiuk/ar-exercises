require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...
surrey = Store.new do |store|
  store.name = "Surrey"
  store.annual_revenue = 224000
  store.mens_apparel = false
  store.womens_apparel = true
end
surrey.save

whistler = Store.new do |store|
  store.name = "Whistler"
  store.annual_revenue = 1900000
  store.mens_apparel = true
  store.womens_apparel = false
end
whistler.save

yaletown = Store.new do |store|
  store.name = "Yaletown"
  store.annual_revenue = 430000
  store.mens_apparel = true
  store.womens_apparel = true
end
yaletown.save

@mens_stores = Store.where(mens_apparel: true)

@mens_stores.each do |store|
  puts "#{store.name}: Annual Revenue of #{store.annual_revenue}"
end

@womens_stores = Store.where("womens_apparel = true AND annual_revenue < 1000000")

@womens_stores.each do |store|
  puts "#{store.name}: Annual Revenue of #{store.annual_revenue}"
end
