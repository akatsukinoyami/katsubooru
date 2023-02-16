# frozen_string_literal: true

class Api::UsersController < ApplicationController
  before_action :set_object, only: %i[show update destroy]

  def index
    render_200(User.all)
  end

  def show
    render_200(@user)
  end

  def update
    if @user.update(object_params)
      render_200(@user)
    else
      render_422({ errors: @user.errors.full_messages })
    end
  end

  def destroy
    @user.destroy
    render_200({})
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
