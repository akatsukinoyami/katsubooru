# frozen_string_literal: true

class Entity < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :user
  belongs_to :origin, optional: true
  belongs_to :author, optional: true

  has_and_belongs_to_many :charachters, class_name: 'Character', join_table: "charachters_entities"
  has_and_belongs_to_many :generals, class_name: 'General', join_table: "entities_generals"
  has_and_belongs_to_many :titles, class_name: 'Title', join_table: "entities_titles"

  enum :rating, %i(unknown safe questionable nsfw)
end
