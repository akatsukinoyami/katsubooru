# frozen_string_literal: true

class Entity < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :user
  belongs_to :artist, optional: true

  has_and_belongs_to_many :characters,  class_name: "Character",  join_table: "characters_entities"
  has_and_belongs_to_many :titles,      class_name: "Title",      join_table: "entities_titles"
  has_and_belongs_to_many :tags,        class_name: "Tag",        join_table: "entities_tags"

  enum :media_type, %i[art photo anime_video real_video]
  enum :rating,     %i[rating_unknown safe questionable nsfw]
  enum :origin,     %i[origin_unknown telegram discord pixiv artstation danbooru gelbooru rule34]

  def as_json(options = nil)
    super({ include: %i[artist titles characters tags] }.merge(options || {}))
  end
end
