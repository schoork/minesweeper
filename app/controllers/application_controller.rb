class ApplicationController < ActionController::Base
  before_action :authenticated!, unless: :is_devise_controller?

end
