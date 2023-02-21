# frozen_string_literal: true

class Entity < ApplicationRecord
  mount_uploader :file, FileUploader
  before_validation :set_file_hash

  belongs_to :user
  belongs_to :collection, optional: true

  has_and_belongs_to_many :tags

  # Hooks methods

    # Called before_validation
    def set_file_hash
      if self.file.url
        path = Dir.pwd + "/public" + self.file.url
        self.file_hash = ImageHash.new(path).hash
      end
    end

    # Called on rendering as_json
    def as_json(options = {})
      hash = super(options)
      hash.merge({
        'thumb' => hash['file']['thumb']['url'],
        'file' => hash['file']['url'],
        'tags' => self.tags_pluck
      })
    end

  def tags_pluck result={}
    # Refactored using ChatGPT
    tag_types = TagType.pluck(:name)
    tag_ids_by_type = self
      .tags
      .includes(:tag_type)
      .where(tag_types: {name: tag_types})
      .group_by { |tag| tag.tag_type.name }

    tag_types.each do |name|
      result[name] = tag_ids_by_type[name]&.pluck(:id) || []
    end

    result
  end

  # Additional methods
    %w[safe sensitive nsfw].each do |name|
      define_method("#{name}?".to_sym,
        -> { self.tags.include? Tag.find_by(name:) }
      )

      scope("#{name}".to_sym,
        -> { joins(:tags).where(tags: { name: }) }
      )
    end
end
