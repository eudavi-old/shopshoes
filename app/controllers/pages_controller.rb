class PagesController < ApplicationController
	def show
		@product = Product.last
		render template: "pages/#{params[:page]}", layout: false
	end
end
