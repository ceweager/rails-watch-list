class Review < ApplicationRecord
  belongs_to :list
  validates :name, :comment, :rating, presence: true
  validates :rating, numericality: true, inclusion: { in: (0..5) }
end
