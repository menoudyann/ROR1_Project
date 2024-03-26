class Classroom < ApplicationRecord
  has_many :people, through: :placements
end
