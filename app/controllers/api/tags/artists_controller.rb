# frozen_string_literal: true

class Api::Tags::ArtistsController < Api::TagsController
  def index
    render json: Artist.all, status: :ok
  end

  def create
    @artist = Artist.new(object_params)

    if @artist.save
      render json: @artist, status: :created
    else
      render(
        json: { errors: @artist.errors },
        status: :unprocessable_entity
      )
    end
  end

  def update
    @artist = Artist.find(params[:id])

    if @artist.update(object_params)
      render json: @artist, status: :ok
    else
      render(
        json: { errors: @artist.errors },
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
