class Role < ApplicationRecord
  has_many :people

  def to_s
    role
  end

end
