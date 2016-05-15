require 'faker'

# Create Categories
20.times do
  Category.create(name: Faker::Book.genre)
end

# Create Articles
100.times do
  Article.create(
    title: Faker::Book.title,
    description: Faker::Lorem.sentence,
    author: Faker::Book.author,
    price: Faker::Commerce.price.to_i,
    category_id: (1..4).to_a.sample
  )
end
