# frozen_string_literal: true

module V1
  class DaysController < V1::BaseController
    def index
      @days = Day.includes(:entries).all
      render json: V1::DaysSerializer.new(@days).serialized_json
    end
  end
end
