# frozen_string_literal: true

class Api::ApiController < ApplicationController
  include JsonWebToken
  before_action :authenticate_request

  private

  def authenticate
    header = request.headers["Authorization"]
    token = header.split.last if header
    decoded = jwt_decode(token)
    @current_user = User.find(decoded[:user_id])

  rescue JWT::DecodeError
    return 'errors.token_not_found'
  rescue ActiveRecord::RecordNotFound
    return 'errors.token_invalid'
  else
    return nil
  end

  def authenticate_request
    error = authenticate

    render(
      json: { errors: [I18n.t(error)] },
      status: :unauthorized
    ) if error
  end
end
