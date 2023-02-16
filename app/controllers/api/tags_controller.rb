# frozen_string_literal: true

class Api::TagsController < Api::ApiController
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
