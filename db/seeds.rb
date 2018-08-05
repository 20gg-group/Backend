#-------------------User--------------------

<<<<<<< HEAD
User.create( email: "admin@gmail.com",password:"admin123",role: 1)
User.create( email: "tom@gmail.com",password:"123456",full_name:"Tom Le",phone_number:"01695669219")
User.create( email: "tin@gmail.com",password:"123456",full_name:"Thien Tin",phone_number:"01695669219")
User.create( email: "gray@gmail.com",password:"123456",full_name:"I'm Gay",phone_number:"01695666812")
User.create( email: "baron@gmail.com",password:"123456",full_name:"Baron lol",phone_number:"01695664105")
User.create( email: "liam@gmail.com",password:"123456",full_name:"Le Xuan Chinh",phone_number:"01695661483")
=======
User.create( email: "admin@gmail.com",password:"123456",role: 1)
User.create( email: "tom@gmail.com",password:"123456",full_name:"Tom le",phone_number:"01695669219")
User.create( email: "tin@gmail.com",password:"123456",full_name:"Ngo Thien Tin",phone_number:"01673995461")
User.create( email: "gray@gmail.com",password:"123456",full_name:"I'm Gay",phone_number:"01654105152")
User.create( email: "baron@gmail.com",password:"123456",full_name:"Bron lol",phone_number:"01695669269")
User.create( email: "liam@gmail.com",password:"123456",full_name:"Le Xuan Chinh",phone_number:"01673992154")
#User.last.update(avatar: File.open(File.join(Rails.root,'app/assets/images/abc.jpg')))
>>>>>>> controller

#-------------------City-------------------

City.create(name: "Hà Nội")         #id: 1
City.create(name: "Hồ Chí Minh")    #id: 2

#------------------District---------------

District.create(name:"Thủ Đức",city_id:2)
District.create(name:"Tân Bình",city_id:2) 
District.create(name:"Quận 10",city_id:2)
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
District.create(name:"Tân Phú",city_id:2)


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

#-------------------Post--------------------
Post.create(
  title:"Cho thuê phòng mới xây ngay ngã tư Bình Triệu, DT 27m2, giá 2.9 triệu",
  price: 3,
  area: 27,
  description:"Nhà trọ mới xây ngay số  6 Binh Chanh Quận Thủ Đức,
nhà xây mới hoàn thiện, thiết kế thao kiểu chưng cư mini, tọa lạc ngay ngã tư Bình Triệu,
cách bên xe Miền Đông 5 phút, ngay trường Đại Học Luật Tp HCM, nằm ngay trung tâm
tiện lưu thông vào trung tâm Tp.".delete("\n"),
  phone_contact_number:"01695669219",
  detail_ids: ["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  type_house: 1,
  sex: 2,
  user_id:2)

Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image1.jpg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image2.jpg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Bình Triệu",add_detail: "")
addr.save!
#======
Post.create(
  title:"Nhà nguyên căn 3 lầu cho thuê, tiện mở văn phòng hoặc gia đình ở",
  price: 17,
  area: 220,
  description:"Cho thuê mở văn phòng hoặc gia đình ở - nhà nằm trong kdc vạn xuân dream home -
đường số 7, tô ngọc vân, thủ đức - kdc an ninh, thoáng mát - đường trước…".delete("\n") ,
  phone_contact_number:"01695669219",
  type_house: 0,
  quantity: 1,
  sex: 2,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
  )
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image3.jpeg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image4.jpeg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "Đường số  7 Tô Ngọc Vân")
addr.save!
#     =======
Post.create(
  title:"Tìm bạn ở ghép khu vực Bình Triệu, Thủ Đức",
  price: 2,
  area: 28,
  description:"Địa chỉ cụ thể 1/3 đường 45,kp2, p. hiệp bình chánh, quận thủ đức. gần chợ bình triệu, 
coop mart bình triệu. để xe trong phòng. nhà vệ sinh trong. phòng…".delete("\n"),
  phone_contact_number:"01695669219",
  type_house: 1,
  quantity: 1,
  sex: 2,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
  )
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image5.jpeg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image6.jpeg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "Đường 45,kp2 , hiệp bình chánh")
addr.save!
#     =======
Post.create(
  title:"Phòng trọ trong chung cư Linh Đông 4s Thủ Đức",
  price: 2.5,
  area: 15,
  description:"Chính chủ cần cho 1 bạn nữ nvvp thuê 1 phòng ngủ nhỏ trong chung cư linh đông 4s thủ đức.
phòng rất sạch sẽ, an ninh, riêng tư, yên tĩnh, thoáng mát, có cửa…".delete("\n"),
  phone_contact_number:"01695669219",
  type_house: 0,
  quantity: 1,
  sex: 2,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
  )
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image7.jpg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image8.jpg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "Linh Đông")
addr.save!
#========
Post.create(
  title:"Căn hộ mini cao cấp, rất phù hợp cho gia đình ở, mới xây,chuẩn căn hộ cho gia đình ở",
  price: 3.5,
  area: 30,
  description:"Toàn bộ khu nhà gồm 60 căn hộ mini thiết kế rất chuẩn, nội thất đẹp.
phòng với diện tích 30m2 được thiết kế 2 gác lửng riêng biệt, thang gổ rất…".delete("\n"),
  phone_contact_number:"01695669219",
  type_house: 0,
  quantity: 3,
  sex: 2,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
  )
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image9.jpg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image10.jpg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "")
addr.save!
#========
Post.create(
  title:"CẦN 1 NỮ NHÂN VIÊN VP Ở GHÉP Ở GẦN PHẠM VĂN ĐỒNG- THỦ ĐỨC (ƯU TIÊN NGƯỜI MIỀN TRUNG)",
  price: 0.85,
  area: 17,
  description:"Mình là nữ sinh năm 92 đang tìm 1 bạn nữ ở ghép ưu tiên là nvvp, 
người miền trung thật thà, dễ thương, sạch sẽ. phòng rất sạch đẹp, toilet sạch sẽ…".delete("\n"),
  phone_contact_number:"01695669219",
  type_house: 0,
  quantity: 1,
  sex: 1,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
)
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image11.jpg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image12.jpg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "KTX Khu A")
addr.save!
#========
Post.create(
  title:"Tìm bạn nữ ở ghép hiền lành, thật thà, sạch sẽ",
  price: 1.6,
  area: 25,
  description:"Phòng trọ mới , đẹp ,sạch sẽ, yên tỉnh thích hợp cho các bạn đi làm ko ồn ào náo nhiệt,
mỗi sáng thức dậy rất bình yên".delete("\n"),
  phone_contact_number:"01695669219",
  type_house: 0,
  quantity: 1,
  sex: 1,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
)
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image13.jpg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image14.jpg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "KTX Khu A")
addr.save!
#========
Post.create(
  title:"Tìm nam VP hoặc sinh viên ở ghép gần Đại Học Luật",
  price: 1.3,
  area: 15,
  description:"Tìm 1 bạn nam vp hoặc sinh viên ở gép gần khu vực coopmark bình triệu, đại học luật. 
diện tích khoảng 15m2 có gác lững, toilet trong phòng. phòng sạch sẽ".delete("\n"),
  phone_contact_number:"01695669219",
  type_house: 0,
  quantity: 1,
  sex: 0,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
)
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image15.jpg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image16.jpg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "Đại học luật")
addr.save!
#========
Post.create(
  title:"Phòng mới xây 100% sạch đẹp ven sông,an ninh tốt bảo vệ 24/7, 
  Ngay Chợ Bình Triệu - Đại Học Luật,Chỉ 15p đến Q1",
  price: 2.6,
  area: 25,
  description:"Khu nhà gồm 45 căn phòng mới xây dạng căn hộ mini cách đại học luật 500m,
  ngã tư phạm văn đồng - ql13, xô viết nghệ tĩnh, chỉ 15p đến q1 + đường số 2".delete("\n"),
  phone_contact_number:"01695669219",
  type_house: 0,
  quantity: 1,
  sex: 2,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
)
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image17.jpg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image18.jpg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: " ql13, xô viết nghệ tĩnh")
addr.save!
#========
Post.create(
  title:"Cho thuê phòng trọ cao cấp mới xây, đầy đủ tiện nghi đường 9 Linh Tây, Thủ Đức",
  price: 2.3,
  area: 20,
  description:"khối nhà 3 tầng mới xây số 96/6a đường 9, phường linh tây, thủ đức. hẻm cụt rộng 5m,
  cạnh phạm văn đồng, kha vạn cân giao thông thuận tiện".delete("\n"),
  phone_contact_number:"01695669219",
  type_house: 0,
  quantity: 1,
  sex: 2,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
  )
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image19.jpg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image20.jpg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "96/6a đường 9, phường linh tây")
addr.save!
#========
Post.create(
  title:"Cho thuê phòng trọ cao cấp phường Hiệp Bình Chánh",
  price: 2,
  area: 16,
  description:"Cho thuê phòng trọ riêng biệt, vệ sinh khép kín, nhà mới xây sạch sẽ thoáng mát,
  gần trường đại học luật cơ sở 2, gần chợ bình triệu - có chỗ nấu".delete("\n"),
  phone_contact_number:"01695669219",
  type_house: 0,
  quantity: 1,
  sex: 2,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
  )
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image1.jpg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image2.jpg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "đại học luật cơ sở 2, gần chợ bình triệu ")
addr.save!
#========
  Post.create(
    title:"Cho thuê phòng trọ cao cấp phường Hiệp Bình Chánh",
    price: 2,
    area: 16,
    description:"Cho thuê phòng trọ riêng biệt, vệ sinh khép kín, nhà mới xây sạch sẽ thoáng mát,
    gần trường đại học luật cơ sở 2, gần chợ bình triệu - có chỗ nấu".delete("\n"),
    phone_contact_number:"01695669219",
    type_house: 0,
    quantity: 1,
    sex: 2,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
    )
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image3.jpeg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image4.jpeg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "đại học luật cơ sở 2, gần chợ bình triệu ")
addr.save!
#========
Post.create(
  title:"Cần người ở ghép phòng rộng thoáng mát",
  price: 1.7,
  area: 20,
  description:"Cần 1 nam ở ghep, sinh viên hoặc người làm vp gọn gàng sạch sẽ, ít đồ,
  giờ giấc tự do, có wwifi riêng địa chỉ: đường 18, quận thủ đức, hồ chí minh".delete("\n"),
  phone_contact_number:"01695669219",
  type_house: 1,
  quantity: 1,
  sex: 2,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
  )
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image5.jpeg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image6.jpeg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "đường 18, quận thủ đức")
addr.save!
#========
Post.create(
  title:"Cho thuê phòng trọ cao cấp, mới xây 100% ngay trung tâm quận Thủ Đức",
  price: 2.6,
  area: 25,
  description:"Cho thuê phòng trọ cao cấp, mới xây 100% địa chỉ: hẻm 17 đường dương văn cam
  cách chợ thủ đức 100m, tiện ích xng quanh đầy đủ :mặt tiền đường".delete("\n"),
  phone_contact_number:"01695669219",
  type_house: 0,
  quantity: 1,
  sex: 2,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
  )
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image7.jpg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image8.jpg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "hẻm 17 đường dương văn cam")
addr.save!
#========
Post.create(
  title:"Thủ Đức – Cần tìm 1 bạn nữ SV hoặc đang đi làm ở ghép tại Hiệp Bình Chánh",
  price: 0.8,
  area: 40,
  description:"Mình đang cần tìm 1 bạn nữ ở ghép. đây là 1 căn nhà cho thuê, phòng trên lầu 2, rộng ,
  thoáng mát có ban công. -có 1 phòng để quần áo, 1 phòng ngủ riêng".delete("\n"),
  phone_contact_number:"01695669219",
  type_house: 0,
  quantity: 1,
  sex: 1,
  detail_ids:["WC riêng", "Chổ để xe","Wifi","Bếp","Giường ngủ", "Camera","Bảo vệ"],
  user_id:2
  )
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image9.jpg')))
Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image10.jpg')))
addr = Post.last.build_address(city: "Hồ Chí Minh",district: "Thủ Đức",add_detail: "KTX Khu A")
addr.save!
#====================
30.times do |i|
  Post.create!(
    title: "Cho thuê phòng trọ cao cấp mới xây,đầy đủ tiện nghi #{i}",
    price: rand(0.5..5.0).round(1),
    area: rand(15..30),
    description: "Đây là 1 căn phòng cho thuê, phòng trên lầu 2, rộng ,thoáng mát có ban công.
-có 1 phòng để quần áo, 1 phòng ngủ riêng , yên tĩnh tiện nghi thân thiện ".delete("\n"),
    phone_contact_number:"01695669219",
    type_house: rand(0..1),
    quantity: rand(1..5),
    sex: rand(0..2) ,
    detail_ids: ["Máy lạnh", "Máy giặt", "Tủ lạnh", "WC riêng", "Chổ để xe",
      "Wifi", "Giờ giấc tự do", "Không chung chủ", "Bếp", "Giường ngủ",
      "Tivi", "Tủ quần áo", "Gác lửng", "Camera", "Bảo vệ", "Thú cưng"].sample(5),
    user_id: rand(2..3)
  )
    Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image11.jpg')))
    Post.last.images.create!(image: File.open(File.join(Rails.root,'app/assets/images/image12.jpg')))
    addr = Post.last.build_address(city: "Hồ Chí Minh",district: ["Thủ Đức","Tân Bình"].sample , add_detail: "Vinova, Đường 20 Gò Vấp")
    addr.save!

end