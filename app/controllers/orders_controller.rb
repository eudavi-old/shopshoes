class OrdersController < ApplicationController

	before_action :authenticate_user!

	def index
		@orders = current_user.cliente.orders.page params[:page]
	end

	def receive_bills
		@orders = Order.this_month
	end

	def pay_bills; end

	def show; end
end