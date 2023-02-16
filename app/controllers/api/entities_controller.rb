# frozen_string_literal: true

class Api::EntitiesController < Api::ApiController
  def create
    @object = model.new(object_params)
    @object.user = @current_user

    if @object.save
      render json: @object, status: :created
    else
      render json: @object.errors, status: :unprocessable_entity
    end
  end

  private

  def model
    Entity.left_joins(:origin, :author, :titles, :characters, :generals)
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(
      :id, :file, :link, :author_id, :origin_id,
      title_ids: [], character_ids: [], general_ids: []
    )
  end
end
