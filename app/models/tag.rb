# frozen_string_literal: true

class Tag < ApplicationRecord
  self.abstract_class

  belongs_to :parent, class_name: "Tag"
  has_many :children, class_name: "Tag"
end
