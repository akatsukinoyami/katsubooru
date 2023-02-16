# frozen_string_literal: true

class Api::TagsController < ApplicationController
  private

  def model
    Tag
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.require(:tag).permit(:type, :name)
  end
end
