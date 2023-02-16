# frozen_string_literal: true

class Api::TagsController < Api::ApiController

  def create
    @object = model.new(object_params)

    if @object.save
      render json: @object, status: :created
    else
      render json: @object.errors, status: :unprocessable_entity
    end
  end

  private

  def model
    Tag
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(:type, :name)
  end
end
