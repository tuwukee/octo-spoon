# frozen_string_literal: true

class Day < ApplicationRecord
  TYPES = [
    :breakfast,
    :lunch,
    :dinner,
    :afternoon_snack,
    :supper,
    :midnight_snack
  ].freeze

  has_many :entries
end
