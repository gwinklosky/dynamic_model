class Customer < ActiveRecord::Base
  validates :name, presence: true
  validates :prefix, presence: true
end
