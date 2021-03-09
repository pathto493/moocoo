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
puts "Cleaning Users 🧹"
User.destroy_all
puts "Cleaning Brands"
Brand.destroy_all
puts "Cleaning Articles"
Article.destroy_all
puts "Cleaning Forums"
Forum.destroy_all


### PRODUCT ###

def generate_product(selected_products)
    chosen_product = Product.all.sample
    while selected_products.include?(chosen_product)
      chosen_product = Product.all.sample
    end
    selected_products << chosen_product
    [selected_products, chosen_product]
end

puts "Create Products 💄"
8.times do |i|
  product = Product.new(
    name: Faker::Commerce.product_name,
    price_cents: (1000..1500).step(10).to_a.sample,
    description: Faker::Food.description,
    brand: Brand.all.sample
    )
  puts "Create Product - #{i + 1}"
  product.save!
  puts "Attaching Photos to Product - #{i + 1}"
  2.times do |j|
    puts "Attaching Photos - #{j + 1} to Product - #{i + 1}"
    file = URI.open("https://picsum.photos/200")
    product.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')
  end
end

### VIDEO ###
puts "Call Youtube API to generate videos 🎥"

id = %w[dPyKEwCn62A joBfpN9eMg0 h-lhr_mMcMA lc8xek03ZUg CpW-Hy8DFic]
id.each do |i|
  url_one = "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{i}&key=#{ENV['YOUTUBE_API_KEY']}"
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
  video.save

  puts "Generate Annotations ▶️"
  selected_products = []
  2.times do |j|
    selected_products, chosen_product = generate_product(selected_products)
    puts "Create Annotation - #{j + 1}"
    Annotation.create!(
      video: video,
      product: chosen_product,
      time_start: (0..5).to_a.sample,
      time_end: (15..20).to_a.sample,
      x_coordinate: rand().round(2),
      y_coordinate: rand().round(2))
  end
end

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
Message.create(title: "Tried many brands but nothing work", date: Time.now, content: "I have used a couple of luxury and drug store brands but nothing works. Any good suggestions out there for severe dry skin?", forum: f1, user: User.all.sample)

puts "Creating message for forum topic 2"
Message.create(title: "Lipstick gone before lunch", date: Time.now, content: "I like using lipstick over lip stain but it is not long lasting. How can I make it last longer?", forum: f2, user: User.all.sample)

puts "Creating message for forum topic 3"
Message.create(title: "Dry skin issue", date: Time.now, content: "I have difficulty layering foundation on my skin as I have dry skin. Any tips? ", forum: f3, user: User.all.sample)


### BRANDS ###
makeup_brands = [{ name: "Dior", image_path: 'dior.jpg'} ,
                 { name: "L'Oreal", image_path: 'Loreal.jpg'},
                 { name: "Lancome", image_path: 'Lancome.jpg'} ]
puts "Create Brands 💄"

makeup_brands.each do |brand|
  Brand.create!(
    name: brand[:name],
    image_file_path: brand[:image_path]
  )
end


puts "Finish seeding 🍑"




### NOT NEEEDED ###

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
