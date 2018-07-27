#-------------------User--------------------
User.create(
  email: "admin@gmail.com",
  password:"123456"
)
#-----------------TypeHouse-----------------

TypeHouse.create( type_house: "Tìm ở ghép")
TypeHouse.create(type_house: "Nhà cho thuê")

#-------------------City-------------------

City.create(name: "Hà Nội")         #id: 1
City.create(name: "Hồ Chí Minh")    #id: 2

#------------------District---------------

District.create(name:"Ba Đình",city_id:1)
District.create(name:"Ba Vì",city_id:1)
District.create(name:"Cầu Giấy",city_id:1)
District.create(name:"Chương Mỹ",city_id:1)
District.create(name:"Đống Đa",city_id:1)
District.create(name:"Cầu Giấy",city_id:1)
District.create(name:"Đống Đa",city_id:1)
District.create(name:"Đông Anh",city_id:1)
District.create(name:"Gia Lâm",city_id:1)
District.create(name:"Hà Đông",city_id:1)
District.create(name:"Hai Bà Trưng",city_id:1)
District.create(name:"Hoàn Kiếm",city_id:1)
District.create(name:"Mê Linh",city_id:1)
District.create(name:"Tây Hồ ",city_id:1)
District.create(name:"Sơn Tây",city_id:1)

District.create(name:"Bình Chánh",city_id:2)
District.create(name:"Bình Tân",city_id:2)
District.create(name:"Bình Thạnh",city_id:2)
District.create(name:"Cần Giờ",city_id:2)
District.create(name:"Củ Chi",city_id:2)
District.create(name:"Gò Vấp",city_id:2)
District.create(name:"Hóc Môn",city_id:2)
District.create(name:"Nhà Bè",city_id:2)
District.create(name:"Phú Nhuận",city_id:2)
District.create(name:"Quận 1",city_id:2)
District.create(name:"Quận 10",city_id:2)
District.create(name:"Quận 11",city_id:2)
District.create(name:"Quận 12",city_id:2)
District.create(name:"Quận 2",city_id:2)
District.create(name:"Quận 3",city_id:2)
District.create(name:"Quận 4",city_id:2)
District.create(name:"Quận 5",city_id:2)
District.create(name:"Quận 6",city_id:2)
District.create(name:"Quận 7",city_id:2)
District.create(name:"Quận 8",city_id:2)
District.create(name:"Quận 9",city_id:2)
District.create(name:"Tân Bình",city_id:2)
District.create(name:"Tân Phú",city_id:2)
District.create(name:"Thủ Đức",city_id:2)

#-------------------Post--------------------
# 10.times do |i|
#   pots "post#{i}"
# Post.create!(tittle:"Phong tro gia re quan 10 #{i}",price:12,area:50,decription:"balballalla",phone_contact_number:"01695669219",user_id:1,type_house_id:1
# )
# end
#-------------------Detail-------------------

# Detail.create(name: "air_conditioner")   #id: 1
# Detail.create(name: "washing_machine")   #id: 2
# Detail.create(name: "refrigerator")
# Detail.create(name: "wc")
# Detail.create(name: "parking")
# Detail.create(name: "wifi")
# Detail.create(name: "free_time")
# Detail.create(name: "separated_owner")
# Detail.create(name: "kitchen")
# Detail.create(name: "bed")
# Detail.create(name: "television")
# Detail.create(name: "wardrobe")
# Detail.create(name: "amezzanine")
# Detail.create(name: "camera")
# Detail.create(name: "security")
# Detail.create(name: "pet")

#----------------