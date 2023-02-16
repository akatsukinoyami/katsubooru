# frozen_string_literal: true

class Api::Tags::CharactersController < Api::TagsController
  private

  def model
    Character
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(:id, :name, :title_id)
  end
end
