class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    connect_to_items_path
  end

end
