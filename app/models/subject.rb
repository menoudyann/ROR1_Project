class Subject < ApplicationRecord
  has_many :exams
  has_and_belongs_to_many :subjects
end
