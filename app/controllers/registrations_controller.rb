class RegistrationsController < Devise::RegistrationsController
  def update
    @user = User.find(current_user.id)
    if @user.update(update_params)
       # Sign in the user by passing validation in case their password changed
       sign_in @user, :bypass => true
       set_flash_message :notice, :updated
       redirect_to root_path
     else
      #  render "edit"
     end
  end

  def create
    @user = User.new(create_params)
    if @user.save
      flash[:notice] = "Successfully created account"
      sign_in :user, @user
      redirect_to root_path
    else
      render "new"
    end
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
    params.require(:user).permit(:name, :dob, :gender, :password, :password_confirmation)
  end
  def create_params
    params.require(:user).permit(:email, :name, :dob, :gender, :password, :password_confirmation)
  end
end
