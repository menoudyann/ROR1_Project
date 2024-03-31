class Grade < ApplicationRecord
  # Associations
  belongs_to :person
  belongs_to :exam

  # Validations
  validates :grade, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 6 }

  # Scope to get all grades by person
  scope :by_person, ->(person) { where(person: person) }
  # Scope to get all grades by exam
  scope :by_exam, ->(exam) { where(exam: exam) }
  # Scope to get all grades by person and exam
  scope :by_person_and_exam, ->(person, exam) { where(person: person, exam: exam) }

  # To string method
  def to_s
    "#{grade}"
  end
end
