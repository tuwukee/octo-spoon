# frozen_string_literal: true

module V1
  class ResourcesController < V1::BaseController
    PAGE_PARAMS = {
      number: 1,
      size: 50
    }

    protected

    def meta(resource)
      {
        current_page:  resource.current_page,
        next_page:     resource.next_page,
        previous_page: resource.prev_page,
        total_pages:   resource.total_pages,
        total_count:   resource.total_count
      }
    end

    def page_params
      return PAGE_PARAMS.merge(params[:page]) if params[:page]

      PAGE_PARAMS
    end

    private

    def resource_params
      data_params = params.require(:data)
      data_params.require(:type)
      data_params.require(:id) if action_name.to_sym == :update
      data_params.require(:attributes).permit!
    end
  end
end