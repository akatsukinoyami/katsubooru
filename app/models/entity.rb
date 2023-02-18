# frozen_string_literal: true

class Entity < ApplicationRecord
  mount_uploader :file, FileUploader
  before_validation :set_file_hash

  belongs_to :user
  belongs_to :collection, optional: true

  has_and_belongs_to_many :authors,
                          class_name: "Author",
                          join_table: "authors_entities"
  has_and_belongs_to_many :characters,
                          class_name: "Character",
                          join_table: "characters_entities"
  has_and_belongs_to_many :medias,
                          class_name: "Media",
                          join_table: "entities_medias"
  has_and_belongs_to_many :origins,
                          class_name: "Origin",
                          join_table: "entities_origins"
  has_and_belongs_to_many :others,
                          class_name: "Other",
                          join_table: "entities_others"
  has_and_belongs_to_many :ratings,
                          class_name: "Rating",
                          join_table: "entities_ratings"
  has_and_belongs_to_many :sources,
                          class_name: "Source",
                          join_table: "entities_sources"
  has_and_belongs_to_many :titles,
                          class_name: "Title",
                          join_table: "entities_titles"

  def as_json(options = {})
    options[:include] = %i[authors characters medias origins others ratings sources titles]
    hash = super(options)
    hash
  end

  def set_file_hash
    if self.file.url
      path = Dir.pwd + "/public" + self.file.url
      self.file_hash = ImageHash.new(path).hash
    end
  end
end
