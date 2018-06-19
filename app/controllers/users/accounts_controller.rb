module Users

	class AccountsController < UserController

		def edit			
		end

		def update_info

			if current_user.update(user_info_params)
				flash[:success] = 'Succesfully saved info.'
			else
				flash[:danger] = current_user.display_error_messages
			end

				redirect_to users_account_path

		end

		def change_password

			user = current_user

			if user.valid_password?(user_password_params[:current_password])
				if user.change_password(user_password_params)
					sign_in(user, bypass: true)
					flash[:success] = 'Succesfully changed password.'
				else
					flash[:danger] = user.display_error_messages
				end
			else
				flash[:danger] = 'Current password was incorrect.'
			end
			redirect_to users_account_path

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