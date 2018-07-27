User.create(
  email: "admin@gmail.com",
  password:"123456"
)

1000.times do |i|
  pots "post#{i}"
Post.create!(tittle:"Phong tro gia re quan 10 #{i}",price:12,area:50,decription:"balballalla",phone_contact_number:"01695669219",user_id:1,type_house_id:1
)
end