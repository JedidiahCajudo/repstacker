class Workout < ApplicationRecord
  has_many :exercises, dependent: :destroy
  accepts_nested_attributes_for :exercises, allow_destroy: true
  validates :date, presence: true
end
