require 'faker'

rand(10..30).times do
  t = Topic.create(title: Faker::Lorem.words(rand(1..4)).join("\n"))
  rand(3..10).times do
    t.posts.create(url: Faker::Internet.url)
  end
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"