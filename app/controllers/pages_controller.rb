class PagesController < ApplicationController
	def show
		@products = Product.last(6)
		render template: "pages/#{params[:page]}", layout: false
	end
end
