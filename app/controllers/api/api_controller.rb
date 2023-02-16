# frozen_string_literal: true

class Api::ApiController < ApplicationController
  include JsonWebToken
  before_action :set_object, only: %i[show update destroy]
  before_action :authenticate_request

  def index
    render json: model.all, status: :ok
  end

  def show
    render json: @object, status: :ok
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

  # Use callbacks to share common setup or constraints between actions.
  def set_object
    @object = model.find(params[:id])
  end

  def authenticate_request
    header = request.headers["Authorization"]
    token = header.split.last if header
    decoded = jwt_decode(token)
  rescue JWT::DecodeError
    render json: { error: "Unauthorized" }, status: :unauthorized
  else
    @current_user = User.find(decoded[:user_id])
  end
end
