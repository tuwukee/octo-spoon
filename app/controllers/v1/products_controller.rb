# frozen_string_literal: true

module V1
  class ProductsController < V1::ResourcesController
    before_action :find_product, only: [:show, :destroy, :update]

    def index
      @products = Product
        .page(page_params[:number])
        .per(page_params[:size])
      options = { meta: meta(@products) }
      render json: V1::ProductsSerializer.new(@products, options).serialized_json
    end

    def create
      @product = Product.new(resource_params)
      if @product.save
        render json: V1::ProductsSerializer.new(@product).serialized_json, status: 201
      else
        render json: {
          errors: @product.errors.map do |key, value|
            { title: key, detail: value, status: 422 }
          end
        }, status: :unprocessable_entity
      end
    end

    def destroy
      if @product.destroy
        head(:no_content)
      else
        render json: {
          errors: @product.errors.map do |key, value|
            { title: key, detail: value, status: 422 }
          end
        }, status: :unprocessable_entity
      end
    end

    def update
      if @product.update(resource_params)
        render json: V1::ProductsSerializer.new(@product).serialized_json
      else
        render json: {
          errors: @product.errors.map do |key, value|
            { title: key, detail: value, status: 422 }
          end
        }, status: :unprocessable_entity
      end
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
