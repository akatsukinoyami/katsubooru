# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request, except: %i[index fallback_index_html]

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

    render_401({ errors: [I18n.t(error)] })
  end

  def render_200 body
    render json: body, status: :ok
  end

  def render_201 body
    render json: body, status: :created
  end

  def render_401 body
    render json: body, status: :unauthorized
  end

  def render_422 body
    render json: body, status: :unprocessable_entity
  end
end
