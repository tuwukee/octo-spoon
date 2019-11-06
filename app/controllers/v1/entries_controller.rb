# frozen_string_literal: true

module V1
  class EntriesController < V1::BaseController
    def index
      @entries = Entry.all
      render json: V1::EntriesSerializer.new(@entries).serialized_json
    end
  end
end
