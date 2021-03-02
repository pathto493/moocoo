# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'pry-byebug'

puts 'seeding videos'
Video.destroy_all

url = 'https://www.googleapis.com/youtube/v3/search'
query = 'makeup'
type = 'video'
key = ENV['YOUTUBE_API_KEY']
url_query = "#{url}?key=#{key}&q=#{query}&type=#{type}"

json = open(url_query).read
parsed_json = JSON.parse(json)

parsed_array = parsed_json['items']


parsed_array.each do |vid|
  vid_id = vid['id']['videoId']
  title = 'testvid'
  description = 'testingonly'
  video_url = "https://www.youtube.com/embed/#{vid_id}"
  Video.create(title: title, description: description, vieo_url: video_url)
end


