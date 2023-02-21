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
      hash = super(options.merge({
        methods: [:tags_select, :tags_multiselect],
      }))

      hash['file']['thumb'] = hash['file']['thumb']['url']
      hash
    end

  # Additional method

    def tags_select
      self.tags.joins(:tag_type).where(tag_type: { allows_multiple: false })
    end

    def tags_multiselect
      self.tags.joins(:tag_type).where(tag_type: { allows_multiple: true })
    end

    %w[safe sensitive nsfw].each do |name|
      define_method("#{name}?".to_sym, -> {
        self.tags.include? Tag.find_by(name:)
      })
    end
end
