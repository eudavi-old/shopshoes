class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def is_admin?
		if not current_user.funcionario.present?
			if not current_user.admin?
				redirect_to root_path
			end
		end
	end

	def manipular_funcionario?
		if user_signed_in? and current_user.funcionario.present? 
			current_user.manipular_funcionario(0) 
		end
	end

	def manipular_cliente?
		if user_signed_in? and current_user.funcionario.present?
			current_user.manipular_cliente(0)
		end
	end

	def manipular_produto?
		if user_signed_in? and current_user.funcionario.present?
			current_user.manipular_produto(0) 
		end
	end
end
