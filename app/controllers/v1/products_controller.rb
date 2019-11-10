# frozen_string_literal: true

module V1
  class ProductsController < V1::BaseController
    before_action :find_product, only: [:show, :destroy, :update]

    def index
      @products = Product.all
      render json: V1::ProductsSerializer.new(@products).serialized_json
    end

    def create
    end

    def destroy
    end

    def update
    end

    def show
      render json: V1::ProductsSerializer.new(@product).serialized_json
    end

    private

    def find_product
      @product = Product.find(params[:id])
    end
  end
end
