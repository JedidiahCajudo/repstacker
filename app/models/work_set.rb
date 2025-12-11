class WorkSet < ApplicationRecord
  belongs_to :exercise
  validates :repetitions, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
end
