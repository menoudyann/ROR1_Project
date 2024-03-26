class Person < ApplicationRecord
  # Include devise modules for authentication
  devise :database_authenticatable, :rememberable

  # Associations
  has_many :grades
  belongs_to :role
  belongs_to :locality
  has_many :classrooms, through: :placements
  has_many :courses, through: :enrollments
  has_many :exams, through: :grades

  # Scope to get all people by role
  scope :students, -> { joins(:role).where('roles.role = ?', 'Étudiant') }
  scope :teachers, -> { joins(:role).where('roles.role = ?', 'Enseignant') }
  scope :deans, -> { joins(:role).where('roles.role = ?', 'Doyen') }
  # scope :students_by_teacher, ->(teacher) {
  #   joins(:role).where('roles.role = ? AND teacher_id = ?', 'Étudiant', teacher.id)
  # }

  def full_name
    "#{first_name} #{last_name}"
  end

  def dean?
    role.role == "Doyen"
  end

  def teacher?
    role.role == "Enseignant"
  end

  def student?
    role.role == "Étudiant"
  end
end
