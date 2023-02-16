class Api::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # POST /auth/sign_up
  def sign_up
    @user = User.new(user_params)
    if @user.save
      render json: { user: @user, token: token }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # POST /auth/sign_in
  def sign_in
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  private

  def token
    jwt_encode(user_id: @user.id)
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:name, :email, :password)
  end
end
