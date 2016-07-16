class RegistrationsController < Devise::RegistrationsController

  layout 'registrations'
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:subscribe_newsletter])
  end

end