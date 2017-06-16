require 'json'
require 'open-uri'

# Adapted from: https://leonid.shevtsov.me/post/need-random-sample-images-why-not-imgur/
# Note we have to change ['galler'] to ['data']


60.times do
  Photo.create(
    username: Faker::Internet.user_name,
    caption: Faker::Lorem.sentence,
    likes_count: Faker::Number.number(4),
    url: Faker::Avatar.image,
    created_at: Faker::Time.between(1.year.ago, Time.now)
  )
end

Photo.all.each do |photo|
  rand(5).times do
    photo.comments.create!(
      username: Faker::Internet.user_name,
      body: Faker::Hipster.sentence
    )
  end
end