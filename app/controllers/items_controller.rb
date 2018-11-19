class ItemsController < ApplicationController

	before_action :authenticate_user!

	def create	
	ActiveRecord::Base.transaction do
      	@order = Order.new(cliente_id: current_user.cliente_id)
		@order.save!
			session[:cart].each do |key, value|
				@order_details = @order.items.create(product_id: key,
					quantidade: value)
				product = Product.find_by id: key
				total_price = @order_details.quantidade * product.preco
				@order_details.update_attributes(preco_final: total_price)
			end
	end
		destroy_session_cart
		redirect_to root_path
	end

  def destroy_session_cart
    session.delete(:cart)
  end
end