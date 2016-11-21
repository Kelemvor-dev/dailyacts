class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end
	def create
		super
	end
	def update
		super
	end

	private

	def sign_up_params
		allow = [:email, :password, :password_confirmation, :username, :first_name, :last_name, :image, :portada]
		params.require(resource_name).permit(allow)
	end

	def account_update_params
    	allow = [:email, :password, :password_confirmation, :username, :first_name, :last_name, :image, :portada]
		params.require(resource_name).permit(allow)
  	end
end
