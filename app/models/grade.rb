class Grade < ApplicationRecord
  # Associations
  belongs_to :person
  belongs_to :exam

  # Scope to get all grades by person
  scope :by_person, ->(person) { where(person: person) }

  # Scope to get all grades by exam
  scope :by_exam, ->(exam) { where(exam: exam) }

  # Scope to get all grades by person and exam
  scope :by_person_and_exam, ->(person, exam) { where(person: person, exam: exam) }

end
