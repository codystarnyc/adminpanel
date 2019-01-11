class ApplicationController < ActionController::Base
  
    protect_from_forgery with: :null_session
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
   

    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to main_app.root_url, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end


    
    def after_sign_in_path_for(resource)
        dashboard_index_path
    end

   
  
   
   
protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :student, :instructor, :admin)} 
#   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me)} 
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password,
  :student, :instructor, :admin)} 
end


end
