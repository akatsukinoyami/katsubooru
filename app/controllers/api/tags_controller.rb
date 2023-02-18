# frozen_string_literal: true

class Api::TagsController < ApplicationController
  def all
    response = {
      artists:      serialize(Artist),
      titles:       serialize(Title),
      characters:   serialize(Character),
      tags:         serialize(Tag),
    }

    render_200(response)
  end

  def index
    render_200(model.all)
  end

  def create
    @tag = model.new(object_params)

    if @tag.save
      render_201(@tag)
    else
      render_422({ errors: @tag.errors.full_messages })
    end
  rescue ActiveRecord::RecordNotUnique
    render_422({
      data: model.where(name: @tag.name),
      errors: [t('errors.tag_is_not_unique', tag: model.name)]
    })
  end

  def update
    @tag = model.find(params[:id])

    if @tag.update(object_params)
      render_200(@tag)
    else
      render_422({ errors: @tag.errors.full_messages })
    end
  end

  private

  def serialize model
    tags = {}
    model.all.as_json.map do |tag|
      tags[tag["id"]] = tag["name"]
    end
    tags
  end
end
