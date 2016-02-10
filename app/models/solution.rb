class Solution < ActiveRecord::Base
  validates :explanation, presence: true
  belongs_to :problem
end
