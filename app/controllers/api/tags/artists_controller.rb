# frozen_string_literal: true

class Api::Tags::ArtistsController < Api::TagsController
  private

  def model
    Artist
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(:id, :name)
  end
end
