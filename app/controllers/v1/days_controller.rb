# frozen_string_literal: true

module V1
  class DaysController < V1::ResourcesController
    def index
      @days = Day
        .includes(:entries)
        .page(page_params[:number])
        .per(page_params[:size])
      options = {
        meta: meta(@days),
        include: [:entries]
      }
      render json: V1::DaysSerializer.new(@days, options).serialized_json
    end
  end
end
