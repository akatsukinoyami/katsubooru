# frozen_string_literal: true

class Api::EntitiesController < ApplicationController
  include Pagy::Backend

  before_action :authenticate,       only: %i[index]
  before_action :set_object,         only: %i[show update destroy]
  after_action  :pagination_headers, only: %i[index]

  def index
    entities = @current_user ? Entity.all : Entity.safe

    @pagy, @entities = pagy(entities, items: object_params[:items])

    result = @entities.each_with_object({}) do |entity, entities|
      entities[entity["id"]] = entity
    end

    render_200(result)
  end

  def show
    render_200(@entity)
  end

  def create
    @entity = Entity.new(object_params)
    @entity.user = @current_user

    if @entity.save
      render_200(@entity)
    else
      render_422({ errors: @entity.errors.full_messages })
    end
  rescue ActiveRecord::NotNullViolation => e
    error = e.to_s.split('ERROR:  ').last.split('DETAIL').first
    render_422({ errors: [error] })
  rescue ActiveRecord::RecordNotUnique
    render_422({
      data: Entity.where(file_hash: @entity.file_hash),
      errors: [I18n.t('errors.entity_is_not_unique')]
    })
  end

  def update
    if @entity.update(object_params)
      render_200(@entity)
    else
      render_422({ errors: @entity.errors.full_messages })
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
