class Entity < ApplicationRecord
  mount_uploader :file, FileUploader
end
