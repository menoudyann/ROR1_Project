class Course < ApplicationRecord
  # Associations
  has_many :enrollments, dependent: :destroy
  has_many :exams, dependent: :destroy
  has_many :classrooms, through: :enrollments
  has_and_belongs_to_many :semesters

  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :is_archived, inclusion: { in: [true, false] }


  # To string method
  def to_s
    name
  end

  # Get the current status of the course in String
  def current_status
    if is_archived
      "Archivé"
    else
      "Actif"
    end
  end
end
