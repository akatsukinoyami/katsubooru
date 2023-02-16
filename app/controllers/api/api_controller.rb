# frozen_string_literal: true

class Api::ApiController < ApplicationController
  include JsonWebToken
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers["Authorization"]
    token = header.split.last if header
    decoded = jwt_decode(token)
  rescue JWT::DecodeError, ActiveRecord::RecordNotFound
    render json: { error: "Unauthorized" }, status: :unauthorized
  else
    @current_user = User.find(decoded[:user_id])
  end
end
