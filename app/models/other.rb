# frozen_string_literal: true

class Other < Tag
  has_and_belongs_to_many :entities,
                          class_name: "Entity",
                          join_table: "entities_others"
end
