class ApplicationController < ActionController::Base
  protect_from_forgery
   
 # before_filter :set_current_user
   def set_locale
    I18n.locale = params[:locale]
  end

  def self.default_url_options(options={})
    options.merge({ :locale => I18n.locale })
  end

  #def set_current_user 
   # User.current = current
  #end
   rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  check_authorization :unless => :devise_controller?

end
