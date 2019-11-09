# frozen_string_literal: true

module V1
  class EntriesSerializer < V1::BaseSerializer
    attributes :content, :total, :type, :time
  end
end
