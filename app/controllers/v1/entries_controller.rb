# frozen_string_literal: true

module V1
  class EntriesController < V1::BaseController
    def index
      render json: Entry.all
    end
  end
end
