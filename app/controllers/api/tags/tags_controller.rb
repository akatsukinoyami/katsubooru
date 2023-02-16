# frozen_string_literal: true

class Api::Tags::TagsController < Api::TagsController
  private

  def model
    Tag
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(:id, :name)
  end
end
