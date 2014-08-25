class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates :year, numericality: {only_integer: true}
  validates :year, numericality: {
    greater_than_or_equal_to: 1981,
    less_than_or_equal_to: Date.today.year,
    message: "must be during a time period that Nic Cage was actively making movies (1981 - present)"
  }
  validates :synopsis, presence: true
end

