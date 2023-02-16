# frozen_string_literal: true

class Api::TagsController < Api::ApiController
  private

  def model
    Tag
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(:type, :name)
  end
end
