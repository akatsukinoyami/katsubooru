# frozen_string_literal: true

class Api::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # POST /api/auth/sign_up
  def sign_up
    required_params = params.require(:name, :email, :password)
    @user = User.new(required_params)

    if @user.save
      render_201({ user: @user, token: "Bearer #{token}"})
    else
      render_422({ errors: @user.errors.full_messages })
    end
  end

  # POST /api/auth/sign_in
  def sign_in
    required_params = params.require(:email, :password)
    @user = User.find_by_email(required_params[:email])

    if @user&.authenticate(required_params[:password])
      render_200({ user: @user, token: "Bearer #{token}"})
    else
      render_401({ errors: [t("errors.wrong_email_or_password")] })
    end
  end

  private

  def token
    jwt_encode(user_id: @user.id)
  end
end
