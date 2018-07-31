#-------------------User--------------------

User.create( email: "admin@gmail.com",password:"123456",role: 1)
User.last.update(avatar: File.open(File.join(Rails.root,'app/assets/images/abc.jpg')))

User.create( email: "tom@gmail.com",password:"123456")
#img = File.open(File.join(Rails.root,'app/assets/images/abc.jpg'))
#User.last.update(avatar: img)
User.create( email: "user@gmail.com",password:"123456")
#============================================================== create by Tin
User.create( email: "ngotinit@gmail.com",password:"ngothientin123vn")
#User.last.update(avatar: img)

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
District.create(name:"Tây Hồ",city_id:1)
District.create(name:"Sơn Tây",city_id:1)
#===================================TP.HCM=============================
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
# Detail.create(name: "air_conditioner")   #id: 1
# Detail.create(name: "washing_machine")   #id: 2
# Detail.create(name: "refrigerator")       # id: 3 
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
#-------------------Post--------------------
Post.create(
  title:"Phong Tro Quan 10",
  price: 1900000,
  area: 9,
  description:"Phong tro gia tre, sach se, thoat mat",
  phone_contact_number:"01695669219",
  user_id:2,
  detail_ids:[1,2,5,7,8]
  )
#======
Post.create(
  title:"Phong tro Quan 2",
  price: 2000000,
  area: 10,
  description:"phong tro quan 2",
  phone_contact_number:"01695669219",
  user_id:3,
  detail_ids:[1,2,3,4,5]
  )
#=======
Post.create(
  title:"Nha cho thue gia tre",
  price: 5000000,
  area: 32,
  description:"Nha cho thue",
  phone_contact_number:"01695669219",
  user_id:4,
  detail_ids:[1,2,7,8]
  )
 
#=======
Post.create(
  title:"Nha cho thue quan 10",
  price: 4500000,
  area: 40,
  description:"balballalla",
  phone_contact_number:"01695669219",
  user_id:2,
  detail_ids:[1,2,5,9,10]
  )
#========
Post.create(
  title:"Phong tro gia re quan 10 ",
  price: 1500000,
  area: 12,
  description:"balballalla",
  phone_contact_number:"01695669219",
  user_id:4,
  detail_ids:[1,2,5,8,9,1]
  )
# 1.times do |i|(
#     Post.create!(title:"Phong tro gia re quan #{i}",price:12,area:50,description:"balballalla",phone_contact_number:"01695669219",user_id:1 )
# )
#--------------------Address---------------
Address.create(post_id: 1,city: "Hồ Chí Minh",district: "Tân Bình",add_detail: "268 Ly Thuong Kiet")
Address.create(post_id: 2,city: "Hồ Chí Minh",district: "District 3",add_detail: "Quan 3 Street")
Address.create(post_id: 3,city: "Hồ Chí Minh",district: "District 5",add_detail: "Quan 5 Street")
Address.create(post_id: 4,city: "Hồ Chí Minh",district: "District 7",add_detail: "Quan 7 Street")
Address.create(post_id: 5,city: "Hồ Chí Minh",district: "District 8",add_detail: "Quan 8 Street")
# Address.create(post_id: 6,city: "Hà Nội",district: "Ba Đình",add_detail: "ABC Street")
# Address.create(post_id: 7,city: "Hà Nội",district: "Đông Anh",add_detail: "ABC Street")
# Address.create(post_id: 8,city: "Hà Nội",district: "Sơn Tây",add_detail: "ABC Street")
# Address.create(post_id: 9,city: "Hà Nội",district: "Gia Lâm",add_detail: "ABC Street")
# Address.create(post_id: 10,city: "Hồ Chí Minh",district: "Tân Bình",add_detail: "268 Ly Thuong Kiet")
# Address.create(post_id: 11,city: "Hồ Chí Minh",district: "District 3",add_detail: "Quan 3 Street")
# Address.create(post_id: 12,city: "Hồ Chí Minh",district: "District 5",add_detail: "Quan 5 Street")
# Address.create(post_id: 13,city: "Hồ Chí Minh",district: "District 7",add_detail: "Quan 7 Street")
# Address.create(post_id: 14,city: "Hồ Chí Minh",district: "District 8",add_detail: "Quan 8 Street")
#===========================IMAGE=======================
# Image.create(post_id: 1,image: File.open('/home/thientin/Pictures/dogss.jpeg'))
# Image.create(post_id: 1,image: File.open('/home/thientin/Pictures/missing.jpeg'))
# Image.create(post_id: 1,image: File.open('/home/thientin/Pictures/PostUI3.png'))
# Image.create(post_id: 1,image: File.open('/home/thientin/Pictures/PostUI2.png'))
# Image.create(post_id: 1,image: File.open('/home/thientin/Pictures/PostUI2.png'))
#====================END============================
