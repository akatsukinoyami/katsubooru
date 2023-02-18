# frozen_string_literal: true

class Author < Tag
  has_and_belongs_to_many :entities,
                          class_name: "Entity",
                          join_table: "authors_entities"
end
