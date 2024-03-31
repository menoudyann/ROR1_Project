class Locality < ApplicationRecord
  # Associations
  has_many :people

  # Validations
  validates :ZIP, presence: true, length: { maximum: 45 }
  validates :locality, presence: true, length: { maximum: 255 }

  # to_s method
  def to_s
    "#{self.ZIP} #{locality}"
  end
end
