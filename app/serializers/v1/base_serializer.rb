# frozen_string_literal: true

module V1
  class BaseSerializer < ActiveModel::Serializer
    include FastJsonapi::ObjectSerializer
  end
end
