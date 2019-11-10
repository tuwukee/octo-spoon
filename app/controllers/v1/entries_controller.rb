# frozen_string_literal: true

module V1
  class EntriesController < V1::ResourcesController
    def index
      @entries = Entry
        .page(page_params[:number])
        .per(page_params[:size])
      options = { meta: meta(@entries) }
      render json: V1::EntriesSerializer.new(@entries, options).serialized_json
    end
  end
end
