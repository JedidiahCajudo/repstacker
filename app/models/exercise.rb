class Exercise < ApplicationRecord
  belongs_to :workout
  has_many :working_sets, dependent: :destroy
  accepts_nested_attributes_for :working_sets, allow_destroy: true, reject_if: :all_blank
  validates :name, presence: true
end
