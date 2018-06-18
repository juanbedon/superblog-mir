module Users

	class AccountsController < UserController

		def edit			
		end

		def update_info

			current_user.update(user_info_params)
			redirect_to users_account_path

		end

		def change_password

			if current_user.valid_password?(user_password_params[:current_password])
				current_user.update(
					password: user_password_params[:new_password],
					password_confirmation: user_password_params[:new_password_confirmation]
				)
			end

		end

		private

		def user_info_params
			params.require(:user).permit(:name, :email, :bio)
		end

		def user_password_params
			params.require(:user).permit(:current_password, :new_password, :new_password_confirmation)
		end

	end

end