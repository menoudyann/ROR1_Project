class Placement < ApplicationRecord
  # Associations
  belongs_to :person
  belongs_to :classroom

  # Validations
  validates :person, presence: true
  validates :classroom, presence: true
end
