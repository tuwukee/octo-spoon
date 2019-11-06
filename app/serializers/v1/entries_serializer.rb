# frozen_string_literal: true

module V1
  class EntriesSerializer < V1::BaseSerializer
    attributes :created_at, :content, :total, :weight
  end
end
