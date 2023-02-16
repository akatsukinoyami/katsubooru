# frozen_string_literal: true

class Api::UsersController < Api::ApiController
  before_action :set_object, only: %i[show update destroy]

  def index
    render json: User.all, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def update
    if @user.update(object_params)
      render json: @user, status: :ok
    else
      render(
        json: { errors: @user.errors },
        status: :unprocessable_entity
      )
    end
  end

  def destroy
    @user.destroy
    render json: "", status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_object
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(:name, :email, :password)
  end
end
