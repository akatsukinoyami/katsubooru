class Tag < ApplicationRecord
  belongs_to :tag_type

  has_and_belongs_to_many :entities

  belongs_to :parent, class_name: "Tag", foreign_key: "parent_id", optional: true
  has_many :children, class_name: "Tag"

  scope :that_allows_multiple,    -> { includes(:tag_type).where('tag_type.allows_multiple = ?', true) }
  scope :that_disallows_multiple, -> { includes(:tag_type).where('tag_type.allows_multiple = ?', false) }

  TagType.all.each do |tag_type|
    scope tag_type.name.to_sym, -> { where(tag_type:) }
  end


  def as_json(options = {})
    super(options.merge({
      except: :parent_id
    }))
  end

  # Returns array including self and parent tags, if parent present
  def tree
    return [self] if parent.nil?
    [self.parent.tree, self].flatten
  end
end
