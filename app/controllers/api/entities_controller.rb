# frozen_string_literal: true

class Api::EntitiesController < ApplicationController
  include Pagy::Backend

  before_action :authenticate,       only: %i[index]
  before_action :set_object,         only: %i[show update destroy]
  after_action  :pagination_headers, only: %i[index]

  def index
    entities = @current_user ? Entity.all : Entity.safe

    @pagy, @entities = pagy(entities, items: object_params[:items])
    render json: @entities, status: :ok
  end

  def show
    render json: @entity, status: :ok
  end

  def create
    @entity = Entity.new(object_params)
    @entity.user = @current_user

    if @entity.save
      render json: @entity, status: :ok
    else
      render(
        json: { errors: @entity.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  rescue ActiveRecord::NotNullViolation => e
    render(
      json: { errors: [e] },
      status: :unprocessable_entity
    )
  end

  def update
    if @entity.update(object_params)
      render json: @entity, status: :ok
    else
      render(
        json: { errors: @entity.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  end

  def destroy
    @entity.destroy
    render json: {}, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_object
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(
      :id, :file, :link, :origin, :rating, :media_type, :items, :page,
      :artist_id, title_ids: [], character_ids: [], tag_ids: []
    )
  end

  def pagination_headers
    pagy_headers_merge(@pagy) if @pagy
  end
end
