# frozen_string_literal: true

module V1
  class ProductsSerializer < V1::BaseSerializer
    attributes :name, :calories, :protein, :fat, :carbohydrate, :cellulose
  end
end
