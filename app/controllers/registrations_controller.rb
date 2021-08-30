class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[first_name last_name
                                               email password password_confirmation
                                               carrer company country city])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name
                                               email password password_confirmation
                                               carrer company country city])
  end
end
