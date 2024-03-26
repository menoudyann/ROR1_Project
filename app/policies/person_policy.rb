class PersonPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.dean?
  end

  def new?
    user.dean?
  end

  def update?
    user.dean? || user.teacher?
  end

  def edit?
    user.dean? || user.teacher?
  end

  def destroy?
    user.dean?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
