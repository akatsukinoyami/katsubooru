# frozen_string_literal: true

class Api::TagsController < ApplicationController
  def all
    response = {
      artists: Artist.all,
      titles: Title.all,
      characters: Character.all,
      tags: Tag.all
    }

    render json: response, status: :ok
  end

  def index
    render json: model.all, status: :ok
  end

  def create
    @tag = model.new(object_params)

    if @tag.save
      render json: @tag, status: :created
    else
      render(
        json: { errors: @tag.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  rescue ActiveRecord::RecordNotUnique
    render(
      json: {
        data: model.where(name: @tag.name),
        errors: [t('errors.tag_is_not_unique', tag: model.name)]
      },
      status: :unprocessable_entity
    )
  end

  def update
    @tag = model.find(params[:id])

    if @tag.update(object_params)
      render json: @tag, status: :ok
    else
      render(
        json: { errors: @tag.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  end
end
