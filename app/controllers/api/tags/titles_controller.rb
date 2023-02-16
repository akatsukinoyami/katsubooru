# frozen_string_literal: true

class Api::Tags::TitlesController < Api::TagsController
  def index
    render json: Title.all, status: :ok
  end

  def create
    @title = Title.new(object_params)

    if @object.save
      render json: @title, status: :created
    else
      render(
        json: { errors: @title.errors },
        status: :unprocessable_entity
      )
    end
  end

  def update
    @title = Title.find(params[:id])

    if @title.update(object_params)
      render json: @title, status: :ok
    else
      render(
        json: { errors: @title.errors },
        status: :unprocessable_entity
      )
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(:id, :name, characters_ids: [])
  end
end
