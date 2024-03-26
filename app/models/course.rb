class Course < ApplicationRecord
  has_many :exams
  has_many :person, through: :enrollments

  def to_s
    name
  end

  def current_status
    if is_archived
      "Archivé"
    else
      "Actif"
    end
  end
end
