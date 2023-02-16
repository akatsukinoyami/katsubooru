# frozen_string_literal: true

class Character < ApplicationRecord
  has_and_belongs_to_many :entities, class_name: "Entity", join_table: "characters_entities"

  def as_json(options = {})
    options[:include] << %i[title]
    super(options)
  end
end
