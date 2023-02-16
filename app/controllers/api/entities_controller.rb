# frozen_string_literal: true

class Api::EntitiesController < ApplicationController
  private

  def model
    Entity
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.require(:entity).permit(:type, :file)
  end
end
