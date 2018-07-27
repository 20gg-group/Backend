User.create(
  email: "admin@gmail.com",
  password:"123456"
)

10.times do |i|
  pots "post#{i}"
Post.create!(tittle:"Phong tro gia re quan 10 #{i}",price:12,area:50,decription:"balballalla",phone_contact_number:"01695669219",user_id:1,type_house_id:1
)
end

# Detail.create(
#   name: "air_conditioner"
# )
# Detail.create(
#   name: "washing_machine"
# )
# Detail.create(
#   name: "refrigerator"
# )
# Detail.create(
#   name: "wc"
# )
# Detail.create(
#   name: "parking"
# )
# Detail.create(
#   name: "wifi"
# )
# Detail.create(
#   name: "free_time"
# )
# Detail.create(
#   name: "separated_owner"
# )
# Detail.create(
#   name: "kitchen"
# )
# Detail.create(
#   name: "bed"
# )
# Detail.create(
#   name: "television"
# )
# Detail.create(
#   name: "wardrobe"
# )
# Detail.create(
#   name: "amezzanine"
# )
# Detail.create(
#   name: "camera"
# )
# Detail.create(
#   name: "security"
# )
# Detail.create(
#   name: "pet"
# )
