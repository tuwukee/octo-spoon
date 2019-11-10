# frozen_string_literal: true

module V1
  class ResourcesController < V1::BaseController
    private

    def resource_params
      data_params = params.require(:data)
      data_params.require(:type)
      data_params.require(:id) if action_name.to_sym == :update
      data_params.require(:attributes).permit!
    end
  end
end