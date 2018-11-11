class PagesController < ApplicationController
	def show
		puts("Mostrando Carrinho")
		puts(session[:cart])
		@product = Product.last
		render template: "pages/#{params[:page]}", layout: false
	end
end
