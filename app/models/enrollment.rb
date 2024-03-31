class Enrollment < ApplicationRecord
  # Associations
  belongs_to :classroom
  belongs_to :course

  # Validations
  validates :classroom, presence: true
  validates :course, presence: true
end
