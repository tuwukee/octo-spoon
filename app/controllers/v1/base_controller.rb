# frozen_string_literal: true

module V1
  class BaseController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    private

    def not_found
      render(
        json: {
          errors: [{
            title: "Not Found",
            detail: "Record not found",
            code: 404,
            status: 404
          }]
        },
        status: 404
      )
    end
  end
end
