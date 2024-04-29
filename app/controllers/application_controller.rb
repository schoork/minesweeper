class ApplicationController < ActionController::Base
  before_action :authenticated!, unless: :is_devise_controller?

  def authenticated!
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def is_devise_controller?
    is_a? DeviseController
  end
end
