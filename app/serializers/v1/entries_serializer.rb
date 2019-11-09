# frozen_string_literal: true

module V1
  class EntriesSerializer < V1::BaseSerializer
    attributes :content, :total, :type, :time

    belongs_to :day, serializer: V1::DaysSerializer
  end
end
