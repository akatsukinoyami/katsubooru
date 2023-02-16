# frozen_string_literal: true

class Api::Tags::TitlesController < Api::TagsController
  private

  def model
    Title
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(:id, :name, characters_ids: [])
  end
end
