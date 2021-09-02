class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[username first_name last_name
                                               email password password_confirmation
                                               occupation company country city profile_picture])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username first_name last_name
                                               email password password_confirmation
                                               occupation company country city personal_web_site_url
                                               about_me_title about_me_description profile_picture])
  end
end
