class PagesController < ApplicationController
	def show
		@products = Product.last(6)
		@product = Product.last
		render template: "pages/#{params[:page]}", layout: false
	end
end
