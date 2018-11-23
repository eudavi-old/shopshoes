class ProvidersController < ApplicationController
	def new
		@provider = Provider.new
	end
end
