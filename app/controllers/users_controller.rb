class UsersController < ApplicationController

  private

  def model
    User
  end

  # Only allow a list of trusted parameters through.
  def object_params
    params.fetch(:user, {})
  end
end
