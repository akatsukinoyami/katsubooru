# frozen_string_literal: true

class Api::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # POST /api/auth/sign_up
  def sign_up
    @user = User.new(user_params)

    if @user.save
      render(
        json: { user: @user, token: "Bearer #{token}"},
        status: :created
      )
    else
      render(
        json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  end

  # POST /api/auth/sign_in
  def sign_in
    @user = User.find_by_email(params[:email])

    if @user&.authenticate(params[:password])
      render(
        json: { user: @user, token: "Bearer #{token}"},
        status: :ok
      )
    else
      render(
        json: { errors: [I18n.t("errors.wrong_email_or_password")] },
        status: :unauthorized
      )
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
