class Person < ApplicationRecord
  # Include devise modules for authentication
  devise :database_authenticatable, :rememberable

  # Associations
  has_many :grades
  belongs_to :role
  belongs_to :locality
  has_many :placements, dependent: :destroy
  has_many :classrooms, through: :placements
  has_many :exams, through: :grades, dependent: :destroy

  # Validations
  validates :gender, presence: true, length: { maximum: 45 }
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :birth_date, presence: true
  validates :address, presence: true, length: { maximum: 255 }
  validates :phone_number, presence: true, length: { maximum: 45 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :locality, presence: true
  validates :role, presence: true

  # Scope to get all people by role
  scope :students, -> { joins(:role).where('roles.role = ?', 'Étudiant') }
  scope :teachers, -> { joins(:role).where('roles.role = ?', 'Enseignant') }
  scope :deans, -> { joins(:role).where('roles.role = ?', 'Doyen') }

  # Get all students of a teacher
  def self.students_in_teacher_classes(person)
    # Raise an error if the person is not a teacher
    raise ArgumentError, "Person must be a teacher" unless person.teacher?
    students.joins(:classrooms).where(classrooms: { id: person.classrooms.pluck(:id) })
  end

  # Concatenate first and last name
  def full_name
    "#{first_name} #{last_name}"
  end

  # Check if the person is a dean
  def dean?
    role.role == "Doyen"
  end

  # Check if the person is a teacher
  def teacher?
    role.role == "Enseignant"
  end

  # Check if the person is a student
  def student?
    role.role == "Étudiant"
  end
end
