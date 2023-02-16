# frozen_string_literal: true

class Title < ApplicationRecord
  has_many :characters
  has_and_belongs_to_many :entities, class_name: "Entity", join_table: "entities_titles"

  enum :media_type, %i[unknown game series movie cartoon anime hentai comic manga]

  def as_json(options = nil)
    super({ include: %i[characters] }.merge(options || {}))
  end
end
