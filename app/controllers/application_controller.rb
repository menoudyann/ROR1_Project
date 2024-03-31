class ApplicationController < ActionController::Base
  # Include Pundit for authorization
  include Pundit::Authorization

  # Re-defining pundit_user method to return current_person
  def pundit_user
    current_person
  end
end
