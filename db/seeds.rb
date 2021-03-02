puts "Start seeding 🍑"

puts "Create Users 🙋‍♂️"
5.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testtest",
    address: Faker::Address.street_address
    )
  puts "Create User - #{i + 1}"
end

puts "Create Products 💄"
10.times do |i|
  Product.create!(
    name: Faker::Commerce.product_name,
    price: (0..50).to_a.sample,
    description: Faker::Food.description
    )
  puts "Create Product - #{i + 1}"
end

puts "Generate Pexel Video from Pexel API 🎥"
def generate_pexel_video
   # Your authentication key
  client = Pexels::Client.new(ENV['PEXELS_KEY']) # Set up the client
  pexels_json_parsed = client.videos.search('makeup') # Search for videos with keyword "waves", return json files with 15 results
  videos = pexels_json_parsed.videos
  # video_url = pexels_json_parsed.videos[0].files[0].link # Choose the first video, take the first video file type (there are HD, SD, etc. options), then take the url link
  # video_type = pexels_json_parsed.videos[0].files[0].file_type # Similar to line above, but take the video type
  # [video_url, video_type]
end
videos = generate_pexel_video

puts "Generate Videos"
videos.each_with_index do |video, index|
  Video.create!(
    title:,
    description: ,
    video_url: ,)
end

puts "Finish seeding 🍑"
