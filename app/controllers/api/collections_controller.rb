class Api::CollectionsController < ApplicationController
  before_action :set_collection, only: %i[ show update destroy ]

  # GET /collections/1
  def show
    render_200(@collection)
  end

  # POST /collections
  def create
    @collection = Collection.new(collection_params)

    if @collection.save
      render_201(@collection)
    else
      render_422({ errors: @collection.errors.full_messages })
    end
  end

  # PATCH/PUT /collections/1
  def update
    if @collection.update(collection_params)
      render_200(@collection)
    else
      render_422({ errors: @collection.errors.full_messages })
    end
  end

  # DELETE /collections/1
  def destroy
    @collection.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collection_params
      params.permit(entity_ids: [])
    end
end
