class Collection < ApplicationRecord
  has_many :entities

  def as_json(options = {})
    if options.key?(:include) && options[:include].class == Array
      options[:include] << %i[entities]
    else
      options[:include] = %i[entities]
    end
    super(options)
  end
end
