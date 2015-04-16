class RegistrationsController < Devise::RegistrationsController
  def update
		binding.pry
    @user = User.find(current_user.id)
  end

  private
  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  # def needs_password?(user, params)
  #   user.email != params[:user][:email] ||
  #     params[:user][:password].present?
  # end

	def update_resource(resource, params)
		resource.update_without_password(params)
	end
end
