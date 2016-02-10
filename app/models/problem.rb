class AbcProblem < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :severity, numericality: { greater_than: 0, less_than: 11}
  has_many :abc_solutions
end
