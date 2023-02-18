# frozen_string_literal: true

class Media < Tag
  has_and_belongs_to_many :entities,
                          class_name: "Entity",
                          join_table: "entities_medias"
end