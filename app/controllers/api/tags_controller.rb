# frozen_string_literal: true

class Api::TagsController < ApplicationController
  def index
    response = {
      artists: Artist.all,
      titles: Title.all,
      characters: Character.all,
      tags: Tag.all
    }

    render json: response, status: :ok
  end
end
