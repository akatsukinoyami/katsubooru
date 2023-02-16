# frozen_string_literal: true

class Api::TagsController < Api::ApiController
  before_action :set_object, only: %i[show update destroy]

  def index
    response = {
      artists: Artist.all,
      titles: Title.all,
      characters: Character.all,
      tags: Tag.all
    }

    render json: response, status: :ok
  end

  def show
    render json: model.all, status: :ok
  end

  def create
    @object = model.new(object_params)

    if @object.save
      render json: @object, status: :created
    else
      render json: @object.errors, status: :unprocessable_entity
    end
  end

  def update
    if @object.update(object_params)
      render json: @object, status: :ok
    else
      render json: @object.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @object.destroy
    render json: "", status: :ok
  end

  private

  def model
    return object_params[:id].capitalize.constantize if model_param

    Tag
  end

  def model_param
    tag_model = object_params[:id]
    return true if tag_model && %w[artist title character tag].include?(tag_model)

    false
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_object
    @object = model.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(:id, :type, :name)
  end
end
