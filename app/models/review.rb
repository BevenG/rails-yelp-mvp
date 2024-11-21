class Review < ApplicationRecord
  validates :content, presence: true
  validates :rating, presence: true
  belongs_to :restaurant
  validates :rating, numericality: { only_integer: true }
  validates :rating, presence: true, inclusion: { in: 0..5 }
end
