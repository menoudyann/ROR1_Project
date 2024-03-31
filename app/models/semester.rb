class Semester < ApplicationRecord
  # Associations
  has_many :exams
  has_and_belongs_to_many :courses

  # Validations
  validates :number, presence: true
  validates :years, presence: true, length: { maximum: 45 }

  # To string method
  def to_s
    "#{number}" + " - " + "#{years}"
  end
end
