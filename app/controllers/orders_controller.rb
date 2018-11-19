class OrdersController < ApplicationController

	before_action :authenticate_user!

	def index
		@orders = current_user.cliente.orders
	end

	def show; end

end