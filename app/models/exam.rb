class Exam < ApplicationRecord
  belongs_to :subject
  has_and_belongs_to_many :semesters
  has_and_belongs_to_many :people
end
