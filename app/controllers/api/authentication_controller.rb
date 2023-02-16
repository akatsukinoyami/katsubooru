# frozen_string_literal: true

class Api::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # POST /api/auth/sign_up
  def sign_up
    pp(params)
    @user = User.new(permitted_params)

    if @user.save
      render_201(@user)
    else
      render_422({ errors: @user.errors.full_messages })
    end
  end

  # POST /api/auth/sign_in
  def sign_in
    @user = User.find_by_email(permitted_params[:email])

    if @user&.authenticate(permitted_params[:password])
      render_200(@user)
    else
      render_401({ errors: [I18n.t("errors.wrong_email_or_password")] })
    end
  end

  private

  def permitted_params
    params.permit(:name, :email, :password)
  end
end
