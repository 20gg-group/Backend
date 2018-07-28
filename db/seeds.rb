#-------------------User--------------------
User.create( email: "admin@gmail.com",password:"123456")
User.create( email: "tom@gmail.com",password:"123456")
User.create( email: "user@gmail.com",password:"123456")

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
District.create(name:"District 1",city_id:2)
District.create(name:"District 10",city_id:2) #id: 26
District.create(name:"District 11",city_id:2)
District.create(name:"District 12",city_id:2)
District.create(name:"District 2",city_id:2)
District.create(name:"District 3",city_id:2)
District.create(name:"District 4",city_id:2)
District.create(name:"District 5",city_id:2)
District.create(name:"District 6",city_id:2)
District.create(name:"District 7",city_id:2)
District.create(name:"District 8",city_id:2)
District.create(name:"District 9",city_id:2)
District.create(name:"Tân Bình",city_id:2)  #id: 37
District.create(name:"Tân Phú",city_id:2)
District.create(name:"Thủ Đức",city_id:2)

#-------------------Detail-------------------

Detail.create(name: "air_conditioner")   #id: 1
Detail.create(name: "washing_machine")   #id: 2
Detail.create(name: "refrigerator")
Detail.create(name: "wc")
Detail.create(name: "parking")
Detail.create(name: "wifi")
Detail.create(name: "free_time")
Detail.create(name: "separated_owner")
Detail.create(name: "kitchen")
Detail.create(name: "bed")
Detail.create(name: "television")
Detail.create(name: "wardrobe")
Detail.create(name: "amezzanine")
Detail.create(name: "camera")
Detail.create(name: "security")
Detail.create(name: "pet")

#-------------------Post--------------------

Post.create!(
  tittle:"Phong tro gia re quan 10 ",
  price: 12,
  area: 50,
  decription:"balballalla",
  phone_contact_number:"01695669219",
  user_id:1,
  details:Detail.find([1,2,5])
  )

# 1.times do |i|(
#     Post.create!(tittle:"Phong tro gia re quan #{i}",price:12,area:50,decription:"balballalla",phone_contact_number:"01695669219",user_id:1 )
# )

#--------------------Address---------------

Address.create(post_id: 1,city: "Hồ  Chí Minh",district: "Tân Bình",add_detail: "268 Ly Thuong Kiet")
Address.create(post_id: 1,city: "Hồ  Chí Minh",district: "District 10",add_detail: "268 Ly Thuong Kiet")
#Address.create(post_id: 1,district_id: 1,add_detail: "90 To Hien Thanh")
#Address.create(post_id: 1,district_id: 1,add_detail: "100 Ly Thuong Kiet")
#Address.create(post_id: 1,district_id: 1,add_detail: "21 Ly Thuong Kiet")
#Address.create(post_id: 1,district_id: 1,add_detail: "60 Ly Thuong Kiet")

#-------------------