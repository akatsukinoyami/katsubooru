# frozen_string_literal: true

class User < ApplicationRecord
  require "securerandom"
  mount_uploader :avatar, AvatarUploader

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :entities

  def as_json(options = nil)
    super({ except: %i[password_digest] }.merge(options || {}))
  end
end
