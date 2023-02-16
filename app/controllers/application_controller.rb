# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request, except: %i[index]

  def fallback_index_html
    render file: "public/index.html"
  end

  private

  def authenticate
    header = request.headers["Authorization"]
    token = header.split.last if header
    decoded = jwt_decode(token)
    @current_user = User.find(decoded[:user_id])
  rescue JWT::DecodeError
    "errors.token_not_found"
  rescue ActiveRecord::RecordNotFound
    "errors.token_invalid"
  else
    nil
  end

  def authenticate_request
    error = authenticate
    return unless error

    render(
      json: { errors: [I18n.t(error)] },
      status: :unauthorized
    )
  end
end
