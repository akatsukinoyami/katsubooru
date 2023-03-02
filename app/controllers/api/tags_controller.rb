# frozen_string_literal: true

class Api::TagsController < ApplicationController

  # GET /tags
  def index
    response = {
      "types" => TagType.pluck(:id, :name).to_h,
      "tags" => Tag.all.index_by(&:id),
    }
    render_200(response)
  end

  # GET /tags/media
  def show
    response = if params[:id] == "types"
      TagType
    else
      Tag
        .includes(:tag_type)
        .where(tag_types: { name: params[:id] })
    end
      &.pluck(:id, :name)
      .to_h || {}

    render_200(response)
  end

  # POST /tags
  def create
    @tag = Tag.new(object_params)

    if @tag.save
      render_201(@tag)
    else
      render_422({ errors: @tag.errors.full_messages })
    end
  rescue ActiveRecord::RecordNotUnique
    render_422({
      data: Tag.where(name: @tag.name),
      errors: [t('errors.tag_is_not_unique', tag: model.name)]
    })
  end

  # PUT /tags
  def update
    @tag = model.find(params[:id])

    if @tag.update(object_params)
      render_200(@tag)
    else
      render_422({ errors: @tag.errors.full_messages })
    end
  end

  private

  def object_params
    params.permit(:name, :parent_id)
  end
end
