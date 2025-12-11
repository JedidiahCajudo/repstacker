class WorkSet < ApplicationRecord
  belongs_to :exercise
  validates :repetitions, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
