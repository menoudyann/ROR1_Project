class Role < ApplicationRecord
  # Associations
  has_many :people

  # Validations
  validates :role, presence: true, length: { maximum: 45 }

  # To string method
  def to_s
    role
  end
end
