class User < ApplicationRecord
  require "securerandom"
  mount_uploader :avatar, AvatarUploader

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :entities
end
