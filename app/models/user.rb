class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :entities
end
