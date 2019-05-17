class CartsController < ApplicationController
	def create
		check_current_cart params[:product_id]
		redirect_to root_path
	end

	def check_current_cart product_id
		if session[:cart].present?
			if session[:cart].key?(product_id.to_s)
				session[:cart][product_id.to_s] += 1
			else
				session[:cart].store(product_id.to_s, 1)
			end
		else
			puts ("Criando um carrinho")
			session[:cart] = {}
			session[:cart].store(product_id.to_s, 1)
		end
	end

	def show_cart
		return unless session[:cart].present?
		@array_product = Product.select_product_by_array_id session[:cart].keys
	end

	def update_cart
		session[:cart][params[:product_id].to_s] = params[:quantity].to_i
		redirect_to show_carts_path
	end

	def delete_cart
		session[:cart].delete(params[:product_id].to_s)
		redirect_to show_carts_path
	end

	def destroy_cart
		session.delete(:cart)
	end
end
