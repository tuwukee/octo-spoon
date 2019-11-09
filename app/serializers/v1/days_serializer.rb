# frozen_string_literal: true

module V1
  class DaysSerializer < V1::BaseSerializer
    attributes :title, :total, :weight, :cycle
    has_many :entries
  end
end
