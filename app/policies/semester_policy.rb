class SemesterPolicy < ApplicationPolicy

  # In this class, we define the rules for who can do what with the Semester model.
  # The methods in this class are called by the controller actions to check if the current user is allowed to perform the action.
  # The `user` method is provided by the `ApplicationPolicy` class and returns
  # https://github.com/varvet/pundit

  def index?
    user.dean?
  end

  def show?
    user.dean?
  end

  def create?
    user.dean?
  end

  def new?
    user.dean?
  end

  def update?
    user.dean?
  end

  def edit?
    user.dean?
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
