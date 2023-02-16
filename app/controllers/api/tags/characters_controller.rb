class Api::Tags::CharactersController < Api::TagsController
  def index
    render json: Character.all, status: :ok
  end

  def create
    @character = Character.new(object_params)

    if @object.save
      render json: @character, status: :created
    else
      render(
        json: { errors: @character.errors },
        status: :unprocessable_entity
      )
    end
  end

  def update
    @character = Character.find(params[:id])

    if @character.update(object_params)
      render json: @character, status: :ok
    else
      render(
        json: { errors: @character.errors },
        status: :unprocessable_entity
      )
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def object_params
    params.permit(:id, :name, :title_id)
  end
end
