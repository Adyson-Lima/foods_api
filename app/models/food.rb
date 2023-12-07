class Food < ApplicationRecord
  validates :name, :description, presence: true
end
