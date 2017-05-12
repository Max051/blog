class Admins::RegistrationsController < Devise::RegistrationsController

# Prevent getting sign up form if there is already an admin
before_action :no_more_users, only: [:new]

  private

def no_more_users
  if Admin.count >= 1
    flash[:alert] = "You cannot register"
    redirect_to new_admin_session_path
  end
end
end
