class ApplicationController < ActionController::Base
  include Pundit::Authorization

  def pundit_user
    current_person
  end

end
