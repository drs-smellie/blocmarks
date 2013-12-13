require 'faker'

rand(4..10).times do
  password = Faker::Lorem.characters(10)
  u = User.new(
    email: Faker::Internet.email, 
    password: password, 
    password_confirmation: password)
  u.save

  rand(10..30).times do
    t = Topic.create(title: Faker::Lorem.words(rand(1..4)).join("\n"))
    rand(3..10).times do
      t.posts.create(url: Faker::Internet.url)
    end
  end
end

u = User.new(
  email: 'melanie.keatley@gmail.com', 
  password: 'blocmarks1', 
  password_confirmation: 'blocmarks1')
u.save
u.update_attribute(:role, 'admin')

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"