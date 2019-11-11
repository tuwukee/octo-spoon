# frozen_string_literal: true

module V1
  class ResourcesController < V1::BaseController
    PAGE_PARAMS = {
      number: 1,
      size: 1
    }.with_indifferent_access

    protected

    def meta(collection)
      {
        current_page: collection.current_page,
        total_pages:  collection.total_pages,
        total_count:  collection.total_count
      }
    end

    def page_params
      return PAGE_PARAMS.merge(params[:page].permit(:number, :size)) if params[:page]

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