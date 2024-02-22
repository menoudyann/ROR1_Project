class Person < ApplicationRecord
  belongs_to :locality
  has_many :historics
  has_and_belongs_to_many :exams
  has_and_belongs_to_many :subjects
end
