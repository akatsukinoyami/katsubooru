class Entity < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :user
  has_and_belongs_to_many :tags
end
