class PagesController < ApplicationController
	def show
		render template: "pages/#{params[:page]}", layout: false
	end
end
