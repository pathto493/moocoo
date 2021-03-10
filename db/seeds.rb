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

puts "Creating articles - start"
name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
article = Article.create(title: "Finding your perfect match", pic_url: "https://source.unsplash.com/rNx2plB7-TQ", author: name, date: Time.now, body: "Tips on getting the right foundation shade")
file = URI.open("https://source.unsplash.com/rNx2plB7-TQ")

puts "article 2"
name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
article = Article.create(title: "How to be chic in 2021", pic_url:"https://source.unsplash.com/B4TjXnI0Y2c", author: name, date: Time.now, body: "The best guide on staying in trend this year")

name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
article = Article.create(title: "Which is longer lasting: lip stain vs lip tint", pic_url: "https://source.unsplash.com/aXYnU9mpit0", author: name, date: Time.now, body: "The verdict is surprising")

puts "Creating forum and messages - start"
f1 = Forum.create(name: "How to layer foundation without caking?")
f2 = Forum.create(name: "How to make lipstick more long lasting?")
f3 = Forum.create(name: "Best foundation brand for dry skin?")

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

def generate_product(selected_products)
    chosen_product = Product.all.sample
    while selected_products.include?(chosen_product)
      chosen_product = Product.all.sample
    end
    selected_products << chosen_product
    [selected_products, chosen_product]
end

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

puts "Call Youtube API to generate videos 🎥"
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

  id = %w[dPyKEwCn62A joBfpN9eMg0 h-lhr_mMcMA lc8xek03ZUg CpW-Hy8DFic]
  id.each do |i|
    url_one = "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{i}&key=#{ENV['YOUTUBE_API_KEY']}"
    url_one_read = open(url_one).read
    video_info = JSON.parse(url_one_read)
    video = Video.new
    video.title = video_info['items'][0]['snippet']['title']
    video.description = video_info['items'][0]['snippet']['description']
    # video.video_url = video_info['items'][0]['snippet']['thumbnails']['default']['url']
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

puts "Create Users 🙋‍♂️"
3.times do |i|
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testtest",
    address: Faker::Address.street_address
    )
  puts "Create User - #{i + 1}"
  user.save!

  selected_products = []
  puts "Create Orders 🧾"
  3.times do |j|
    puts "Create Order - #{j + 1}"
    selected_products, chosen_product = generate_product(selected_products)
    Order.create!(
      quantity: (1..5).to_a.sample,
      user: user,
      product: chosen_product
    )
  end

  puts "Creating reviews - start"
  products = Product.all
  products.each do |product|
   Review.create!(user: user, product: product, comment: Faker::Hipster.sentence(word_count: 3, supplemental: true, random_words_to_add: 0, open_compounds_allowed: false), rating: rand(1..5))
  end
end
puts "Creating messages for forum - start"
Message.create(title: "Help", date: Time.now, content: "I need help with this issue", forum: f1, user: User.all.sample)
Message.create(title: "Help", date: Time.now, content: "I need help with this issue", forum: f2, user: User.all.sample)
Message.create(title: "Help", date: Time.now, content: "I need help with this issue", forum: f3, user: User.all.sample)



# article = Article.create(title: "Finding your perfect match", author: "#{Faker::Name.first_name Faker::Name.last_name}", date: Time.now, body: "Tips on getting the right foundation shade")
# file = URI.open("https://source.unsplash.com/1600x900/rNx2plB7-TQ")
# article.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

# article = Article.create(title: "How to be chic in 2021", author: "#{Faker::Name.first_name Faker::Name.last_name}", date: Time.now, body: "The best guide on staying in trend this year")
# file = URI.open("https://source.unsplash.com/1600x900/B4TjXnI0Y2c")
# article.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

# article = Article.create(title: "Which is longer lasting: lip stain vs lip tint", author: "#{Faker::Name.first_name Faker::Name.last_name}", date: Time.now, body: "The verdict is surprising")
# file = URI.open("https://source.unsplash.com/1600x900/aXYnU9mpit0")
# article.photos.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/jpg')

# puts "Creating forum - start"
# Forum.create(name: "How to layer foundation without caking?")
# Forum.create(name: "How to make lipstick more long lasting?")
# Forum.create(name: "Best foundation brand for dry skin?")

puts "Finish seeding 🍑"
