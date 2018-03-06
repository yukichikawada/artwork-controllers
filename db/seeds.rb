# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

USERNAMES = ['youknowhu', 'ilovelucy', 'happygolucky', 'newyorktimes']

USERNAMES.each do |username|
  User.create!({:username => username})
end

ARTWORKS = [
  { title: 'Mona Lisa', image_url: 'google.com/1' , artist_id: 1},
  { title: 'Mount Rushmore', image_url: 'google.com/2' , artist_id: 2},
  { title: 'Dogs Playing Poker', image_url: 'google.com/3' , artist_id: 3},
  { title: 'Last Supper Lisa', image_url: 'google.com/4', artist_id: 1}
]

ARTWORKS.each do |artwork|
  Artwork.create!(artwork)
end

(1..3).each do |i|
  (1..4).each do |j|
    ArtworkShare.create!({artwork_id: i, viewer_id: j})
  end
end
