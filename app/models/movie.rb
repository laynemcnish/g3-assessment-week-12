class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates :year, numericality: { only_integer: true }
  validates :synopsis, presence: true
end