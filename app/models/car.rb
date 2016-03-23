class Car < ActiveRecord::Base
  validates :year, :make, :model, :price, presence: true
  validates :price, :year, numericality: true
end
