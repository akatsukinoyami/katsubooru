class TagType < ApplicationRecord
  has_many :tags

  scope :that_allows_multiple,    -> { where(allows_multiple: true ) }
  scope :that_disallows_multiple, -> { where(allows_multiple: false) }
end
