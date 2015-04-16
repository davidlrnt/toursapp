class RegistrationsController < Devise::RegistrationsController
  def update
    @user = User.find(current_user.id)
    @user.update(update_params)
    redirect_to users_path
  end

  private
  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  # def needs_password?(user, params)
  #   user.email != params[:user][:email] ||
  #     params[:user][:password].present?
  # end

  def update_params
    params.require(:user).permit(:name, :email, :dob, :gender)
  end
end
