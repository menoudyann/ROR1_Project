class Classroom < ApplicationRecord
  # Associations
  has_many :placements
  has_many :enrollments
  has_many :people, through: :placements
  has_many :courses, through: :enrollments

  # Validations
  validates :promotion_start_date, presence: true
  validates :promotion_end_date, presence: true
  # Call the private method end_date_after_start_date to validate the dates
  validate :end_date_after_start_date

  # Concatenation of name with (promotion_start_date - promotion_end_date)
  def full_name
    "#{name} (#{promotion_start_date.year} - #{promotion_end_date.year})"
  end

  private

  # Validate that the end date is after the start date
  def end_date_after_start_date
    return if promotion_end_date.blank? || promotion_start_date.blank?

    if promotion_end_date < promotion_start_date
      errors.add(:promotion_end_date, "must be after the start date")
    end
  end
end
