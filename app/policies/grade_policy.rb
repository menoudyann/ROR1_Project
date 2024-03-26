class GradePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.dean? || user.teacher?
  end

  def new?
    user.dean? || user.teacher?
  end

  def update?
    user.dean? || user.teacher?
  end

  def edit?
    user.dean? || user.teacher?
  end

  def destroy?
    user.dean? || user.teacher?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
