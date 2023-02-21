# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

%w[authors characters_author characters_anime characters_cartoon characters_game entities tags titles].each do |model|
  require_relative "seeds/#{model}"
end

user = User.create(name: 'katsu', email: 'hirokod3@gmail.com', password: 'q1w2e3r4')
pp "token: " + user.as_json["token"]

TagType.create(%w[tag title character].map { |name| { name:, allows_multiple: true } })
TagType.create(%w[author media origin rating source].map { |name| { name:, allows_multiple: false } })

{
  'media'  => %w[art photo anime_video real_video],
  'origin' => %w[unknown_origin game series movie cartoon anime hentai comic manga],
  'rating' => %w[unknown_rating safe sensitive nsfw],
  'source' => %w[unknown_origin telegram discord pixiv artstation danbooru gelbooru rule34],
}.each do |tag_type, tags|
  tag_type = TagType.find_by(name: tag_type)
  tags = tags.map { |name| { name:, tag_type: } }
  Tag.create(tags)
end

authors()
tags()
titles()
characters_anime()
characters_author()
characters_cartoon()
characters_game()
entities(user)
