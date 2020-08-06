class ApplicationController < ActionController::Base
    include SessionsHelper


  def require_user
    redirect_to new_session_path unless current_user
  end
end
