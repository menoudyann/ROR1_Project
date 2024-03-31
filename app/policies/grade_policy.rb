class GradePolicy < ApplicationPolicy

  # In this class, we define the rules for who can do what with the Grade model.
  # The methods in this class are called by the controller actions to check if the current user is allowed to perform the action.
  # The `user` method is provided by the `ApplicationPolicy` class and returns
  # https://github.com/varvet/pundit


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
