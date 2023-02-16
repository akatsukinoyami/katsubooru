# frozen_string_literal: true

class Api::Tags::TagsController < Api::TagsController
  def index
    render json: Tag.all, status: :ok
  end

  def create
    @tag = Tag.new(object_params)

    if @object.save
      render json: @tag, status: :created
    else
      render(
        json: { errors: @tag.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(object_params)
      render json: @tag, status: :ok
    else
      render(
        json: { errors: @tag.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(:id, :name)
  end
end
