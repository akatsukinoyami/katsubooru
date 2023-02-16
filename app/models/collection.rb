class Collection < ApplicationRecord
  has_many :entities

  def as_json(options = {})
    options[:include] << %i[entities]
    super(options)
  end
end
