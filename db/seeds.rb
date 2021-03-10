require 'open-uri'
require 'json'

puts "Start seeding 🍑"

puts "Cleaning Orders 🧹"
Order.destroy_all
puts "Cleaning Annotations 🧹"
Annotation.destroy_all
puts "Cleaning Videos 🧹"
Video.destroy_all
puts "Cleaning Products 🧹"
Product.destroy_all
puts "Cleaning Purchases 🧹"
Purchase.destroy_all
puts "Cleaning Messages 🧹"
Message.destroy_all
puts "Cleaning Brands"
Brand.destroy_all
puts "Cleaning Articles"
Article.destroy_all
puts "Cleaning Forums"
Forum.destroy_all
puts "Cleaning Users 🧹"
User.destroy_all

### BRANDS ###
makeup_brands = [{ name: "Dior", image_path: 'dior.jpg'} ,
                 { name: "L'Oreal", image_path: 'Loreal.jpg'},
                 { name: "Lancome", image_path: 'Lancome.jpg'},
                 { name: "Shiseido", image_path: 'shiseido.png'} ]
puts "Create Brands 💄"

makeup_brands.each do |brand|
  Brand.create!(
    name: brand[:name],
    image_file_path: brand[:image_path]
  )
end


### PRODUCT ###

puts "Create Products 💄"
brand = Brand.find_by(name: "Shiseido")

product = Product.create(
  name: "Ultimate Defence Refresh Mist",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)

puts "Attaching Photos to Product 1"
file = open("app/assets/images/m6.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 1"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')


product = Product.create(
  name: "Treatment Softener",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)

puts "Attaching Photos to Product 2"
file = open("app/assets/images/m2.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 2"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')



product = Product.create(
  name: "Ultimune Eye",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 3"
file = open("app/assets/images/m5.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 3"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')


product = Product.create(
  name: "Ultimune Powder Infusing Concentrate",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 4"
file = open("app/assets/images/m3.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 4"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')


product = Product.create(
  name: "Synchro Skin Soft Blurring Primer",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 5"
file = open("app/assets/images/m1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 5"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

product = Product.create(
  name: "Synchro Skin Radiant Lifting Foundation",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 6"
file = open("app/assets/images/m8.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 6"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

product = Product.create(
  name: "Synchro Skin Self Refreshing Concealer",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 7"
file = open("app/assets/images/m14.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 7"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

product = Product.create(
  name: "Minimalist Whipped Powder Blush",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 8"
file = open("app/assets/images/m17.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 8"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')


product = Product.create(
  name: "Brow Inktrid",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 9"
file = open("app/assets/images/m18.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 9"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')


product = Product.create(
  name: "Microliner Ink",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 10"
file = open("app/assets/images/m10.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 10"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')


product = Product.create(
  name: "Essentialist Eye Palette",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 11"
file = open("app/assets/images/m12.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 11"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')


product = Product.create(
  name: "Imperialash Mascara",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 12"
file = open("app/assets/images/m11.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 12"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

product = Product.create(
  name: "Innerglow Cheek Powder",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 13"
file = open("app/assets/images/m17.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 13"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')


product = Product.create(
  name: "Colorgel Lip Balm",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 14"
file = open("app/assets/images/m15.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 14"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')


product = Product.create(
  name: "Synchro Skin Self Refreshing Custom Finish Powder Foundation",
  price_cents: (1000..1500).step(10).to_a.sample,
  description: "",
  brand: brand
)


puts "Attaching Photos to Product 15"
file = open("app/assets/images/m16.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

puts "Attaching Photos to Product 15"
file = open("app/assets/images/f1.jpg")
product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

### VIDEO ###
puts "Call Youtube API to generate videos 🎥"

id = %w[dPyKEwCn62A joBfpN9eMg0 h-lhr_mMcMA lc8xek03ZUg CpW-Hy8DFic]
id.each do |i|
  url_one = "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{i}&key=#{ENV['YOUTUBE_API_KEY']}"
  binding.pry
  url_one_read = open(url_one).read
  video_info = JSON.parse(url_one_read)
  video = Video.new
  video.title = video_info['items'][0]['snippet']['title']
  video.description = video_info['items'][0]['snippet']['description']
  video.youtube_id = video_info['items'][0]['id']
  video.video_url = "https://www.youtube.com/embed/#{i}"
  video.creator = video_info['items'][0]['snippet']['channelTitle']
  video.tags = video_info['items'][0]['snippet']['tags']
  url_two = "https://www.googleapis.com/youtube/v3/videos?part=statistics&id=#{i}&key=#{ENV['YOUTUBE_API_KEY']}"
  url_two_read = open(url_two).read
  video_stats = JSON.parse(url_two_read)
  video.likes = video_stats['items'][0]['statistics']['likeCount']
  video.views = video_stats['items'][0]['statistics']['viewCount']

  video_duration_url = open("https://www.googleapis.com/youtube/v3/videos?part=contentDetails&id=#{i}&key=#{ENV['YOUTUBE_API_KEY']}").read
  video_duration_data = JSON.parse(video_duration_url)['items'][0]['contentDetails']['duration'].scan(/\d+/)
  video_length = video_duration_data[0].to_i * 60 + video_duration_data[1].to_i
  video.length_in_seconds = video_length
  video.save
end

### ANNOTATION FOR ONLY ONE VIDEO ###

puts "Generate Annotations ▶️"
video = Video.find_by(title: "THE EASIEST WAY TO ENHANCE YOUR FACE WITH MAKEUP! | Hindash")
Annotation.create!(
  video: video,
  product: Product.find_by(name: "Ultimate Defence Refresh Mist"),
  time_start: 70,
  time_end: 74)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Treatment Softener"),
  time_start: 75,
  time_end: 101)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Ultimune Eye"),
  time_start: 102,
  time_end: 119)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Ultimune Powder Infusing Concentrate"),
  time_start: 120,
  time_end: 136)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Synchro Skin Soft Blurring Primer"),
  time_start: 137,
  time_end: 168)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Synchro Skin Radiant Lifting Foundation"),
  time_start: 169,
  time_end: 231)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Synchro Skin Self Refreshing Concealer"),
  time_start: 232,
  time_end: 286)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Minimalist Whipped Powder Blush"),
  time_start: 287,
  time_end: 327)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Brow Inktrid"),
  time_start: 328,
  time_end: 377)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Microliner Ink"),
  time_start: 378,
  time_end: 431)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Essentialist Eye Palette"),
  time_start: 432,
  time_end: 487)

# Annotation.create!(
#   video: video,
#   product: Product.find_by(name: "Microliner Ink"),
#   time_start: 488,
#   time_end: 498)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Imperialash Mascara"),
  time_start: 499,
  time_end: 509)

# Annotation.create!(
#   video: video,
#   product: Product.find_by(name: "Synchro Skin Self Refreshing Concealer"),
#   time_start: 510,
#   time_end: 532)

# Annotation.create!(
#   video: video,
#   product: Product.find_by(name: "Essentialist Eye Palette"),
#   time_start: 542,
#   time_end: 555)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Innerglow Cheek Powder"),
  time_start: 556,
  time_end: 579)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Colorgel Lip Balm"),
  time_start: 580,
  time_end: 605)

Annotation.create!(
  video: video,
  product: Product.find_by(name: "Synchro Skin Self Refreshing Custom Finish Powder Foundation"),
  time_start: 606,
  time_end: 621)

# Annotation.create!(
#   video: video,
#   product: Product.find_by(name: "Ultimune Defense Refesh Mist"),
#   time_start: 622,
#   time_end: 627)




### USER ###
puts "Create Users 🙋‍♂️"

user = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "test@test.com",
  password: "testtest",
  address: Faker::Address.street_address
  )
user.save!


### CREATING REVIEW FOR EACH PRODUCT ###
puts "Creating reviews - start"
products = Product.all
products.each do |product|
  Review.create!(user: user, product: product, comment: "Best product ever! Worth every penny.", rating: 5)
end


### ARTICLES ###
puts "Creating articles - start"

puts "Creating article 1"
name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
Article.create(title: "Finding your perfect match", pic_url: "https://source.unsplash.com/rNx2plB7-TQ", author: name, date: Time.now, body: "Tips on getting the right foundation shade")

puts "Creating article 2"
name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
Article.create(title: "How to be chic in 2021", pic_url:"https://source.unsplash.com/B4TjXnI0Y2c", author: name, date: Time.now, body: "The best guide on staying in trend this year")

puts "Creating article 3"
name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
Article.create(title: "Which is longer lasting: lip stain vs lip tint", pic_url: "https://source.unsplash.com/aXYnU9mpit0", author: name, date: Time.now, body: "The verdict is surprising")


### FORUM ###
puts "Creating forum and messages - start"

puts "Creating article 3"
f1 = Forum.create(name: "How to layer foundation without caking?")

puts "Creating article 3"
f2 = Forum.create(name: "How to make lipstick more long lasting?")

puts "Creating article 3"
f3 = Forum.create(name: "Best foundation brand for dry skin?")


### MESSAGE FOR EACH FORUM ###
puts "Creating messages for forum - start"

puts "Creating message for forum topic 1"
Message.create(title: "Tried many brands but nothing work", date: Time.now, content: "I have used a couple of luxury and drug store brands but nothing works. Any good suggestions out there for severe dry skin?", forum: f3, user: User.all.sample)

puts "Creating message for forum topic 2"
Message.create(title: "Lipstick gone before lunch", date: Time.now, content: "I like using lipstick over lip stain but it is not long lasting. How can I make it last longer?", forum: f2, user: User.all.sample)

puts "Creating message for forum topic 3"
Message.create(title: "Dry skin issue", date: Time.now, content: "I have difficulty layering foundation as I have dry skin. Any tips? ", forum: f1, user: User.all.sample)





puts "Finish seeding 🍑"














### NOT NEEEDED ###
def generate_product(selected_products)
    chosen_product = Product.all.sample
    while selected_products.include?(chosen_product)
      chosen_product = Product.all.sample
    end
    selected_products << chosen_product
    [selected_products, chosen_product]
end

def generate_pexel_video
   # Your authentication key
  client = Pexels::Client.new(ENV['PEXELS_KEY']) # Set up the client
  pexels_json_parsed = client.videos.search('makeup') # Search for videos with keyword "waves", return json files with 15 results
  videos = pexels_json_parsed.videos
  # video_url = pexels_json_parsed.videos[0].files[0].link # Choose the first video, take the first video file type (there are HD, SD, etc. options), then take the url link
  # video_type = pexels_json_parsed.videos[0].files[0].file_type # Similar to line above, but take the video type
  # [video_url, video_type]
end

# def generate_youtube_video
#   url = 'https://www.googleapis.com/youtube/v3/search'
#   query = 'makeup'
#   type = 'video'
#   key = ENV['YOUTUBE_API_KEY']
#   url_query = "#{url}?key=#{key}&q=#{query}&type=#{type}&part=snippet"

#   json = open(url_query).read
#   parsed_json = JSON.parse(json)
#   videos = parsed_json['items']
# end
# videos = generate_youtube_video

# puts "Generate Videos 🎥"
# (0...5).each do |i|
#   youtube_video_id = videos[i]['id']['videoId']
#   video_url = "https://www.youtube.com/embed/#{youtube_video_id}"
#   video = Video.new(
#     title: videos[i]['snippet']['title'],
#     description: videos[i]['snippet']['description'],
#     video_url: video_url,
#     creator: videos[i]['snippet']['channelTitle']
#     )
#   puts "Create Video - #{i + 1}"
#   video.save!


  # puts "Generate Annotations ▶️"
  # selected_products = []
  # 2.times do |j|
  #   selected_products, chosen_product = generate_product(selected_products)
  #   puts "Create Annotation - #{j + 1}"
  #   Annotation.create!(
  #     video: video,
  #     product: chosen_product,
  #     time_start: (0..5).to_a.sample,
  #     time_end: (15..20).to_a.sample,
  #     x_coordinate: rand().round(2),
  #     y_coordinate: rand().round(2))
  # end

# puts "Create Users 🙋‍♂️"
# 3.times do |i|
#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: "test@test.com",
#     # email: Faker::Internet.email,
#     password: "testtest",
#     address: Faker::Address.street_address
#     )
#   puts "Create User - #{i + 1}"
#   user.save!

#   selected_products = []
#   puts "Create Orders 🧾"
#   3.times do |j|
#     puts "Create Order - #{j + 1}"
#     selected_products, chosen_product = generate_product(selected_products)
#     Order.create!(
#       quantity: (1..5).to_a.sample,
#       user: user,
#       product: chosen_product
#     )
#   end


# puts "Create Products 💄"
# 8.times do |i|
#   product = Product.new(
#     name: Faker::Commerce.product_name,
#     price_cents: (1000..1500).step(10).to_a.sample,
#     description: Faker::Food.description,
#     brand: Brand.all.sample
#     )
#   puts "Create Product - #{i + 1}"
#   product.save!
#   puts "Attaching Photos to Product - #{i + 1}"
#   2.times do |j|
#     puts "Attaching Photos - #{j + 1} to Product - #{i + 1}"
#     file = URI.open("https://picsum.photos/200")
#     product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')
#   end
# end
