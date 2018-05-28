class RegistrationsController < Devise::RegistrationsController
  protected

  # def after_sign_up_path_for(resource)
  #   connect_to_employee_dashboard @employee
  # end
end
