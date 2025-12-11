class Exercise < ApplicationRecord
  belongs_to :workout
  has_many :work_sets, dependent: :destroy
  validates :name, presence: true
end
