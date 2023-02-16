# frozen_string_literal: true

class Api::EntitiesController < Api::ApiController
  include Pagy::Backend

  before_action :set_object, only: %i[show update destroy]
  after_action :pagination_headers, only: %i[index]

  def index
    @pagy, @entities = pagy(Entity.all)
    render json: @entities, status: :ok
  end

  def show
    render json: @entity, status: :ok
  end

  def create
    @entity = Entity.new(object_params)
    @entity.user = @current_user

    if @entity.save
      render json: @entity, status: :created
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  def update
    if @entity.update(object_params)
      render json: @entity, status: :ok
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @entity.destroy
    render json: "", status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_object
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(
      :id, :file, :link, :artist_id, :origin, :rating, :media_type,
      title_ids: [], character_ids: [], tag_ids: []
    )
  end

  def pagination_headers
    pagy_headers_merge(@pagy) if @pagy
  end
end
