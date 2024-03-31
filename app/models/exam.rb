class Exam < ApplicationRecord
  # Associations
  has_many :grades, dependent: :destroy
  belongs_to :course
  belongs_to :semester
  has_many :people, through: :grades

  # Validations
  validates :date, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :coefficient, presence: true
  validates :course, presence: true
  validates :semester, presence: true

  # To string method
  def to_s
    "#{course} - #{title}"
  end

  def with_year
    "#{title} - (Semestre #{semester.number}) - (#{semester.years})"
  end
end
