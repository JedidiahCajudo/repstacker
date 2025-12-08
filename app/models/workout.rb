class Workout < ApplicationRecord
  validates :date, presence: true
  has_many :exercises, dependent: :destroy
end
