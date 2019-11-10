# frozen_string_literal: true

module V1
  class BaseController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActionController::ParameterMissing, with: :forbidden

    private

    def not_found
      render(
        json: {
          errors: [{
            title: "Not Found",
            detail: "Record not found",
            status: 404
          }]
        },
        status: :not_found
      )
    end

    def forbidden(exception)
      render(
        json: {
          errors: [{
            title: "Forbidden",
            detail: exception.to_s,
            status: 403
          }]
        },
        status: :forbidden
      )
    end
  end
end
