class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :null_session
  wrap_parameters false

  def index
  end

end
