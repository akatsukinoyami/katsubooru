# frozen_string_literal: true

class Character < ApplicationRecord
  has_and_belongs_to_many :entities, class_name: "Entity", join_table: "characters_entities"

  def as_json(options = {})
    if options.key?(:include) && options[:include].class == Array
      options[:include] << %i[title]
    else
      options[:include] = %i[title]
    end
    super(options)
  end
end
