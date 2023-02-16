# frozen_string_literal: true

class Character < Tag
  has_and_belongs_to_many :entities, class_name: "Entity", join_table: "charachters_entities"
end
