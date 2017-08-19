User.create email: "iload9x@gmail.com",
  password: "123123", password_confirmation: "123123",
  username: "iload9x", role: 1,
  avatar: File.open(Rails.root.join("app", "assets",
    'images', "faker_image", "#{rand(1..10).to_s}.jpg"))

User.create email: "admin@pixel.com",
  password: "123123", password_confirmation: "123123",
  username: "admin", role: 1,
  avatar: File.open(Rails.root.join("app", "assets",
    'images', "faker_image", "#{rand(1..10).to_s}.jpg"))
#user
(1..10).each do |time|
  User.create! email: Faker::Internet.email,
    password: "123123", password_confirmation: "123123",
    username: "image_user#{time}", role: 0,
    avatar: File.open(Rails.root.join("app", "assets",
      'images', "faker_image", "#{rand(1..10).to_s}.jpg"))
end

#photo
(1..10).each do |time|
  user = User.find_by id: time
  (1..10).each do |photo|
    user.photos.create(image:  File.open(Rails.root.join("app", "assets",
      'images', "faker_image", "#{rand(1..10).to_s}.jpg")),
      status: 1, deleted: 0)
  end
end

#follow
(1..10).each do |time|
  user = User.find_by id: time
  (1..rand(2..10)).each do |followed_id|
    next if time == followed_id
    followed = User.find_by id: followed_id
    user.follow followed if followed
  end
end


