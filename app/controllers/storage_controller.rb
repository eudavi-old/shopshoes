class StorageController < ApplicationController

	def index
		@products = Product.all
	end
end
