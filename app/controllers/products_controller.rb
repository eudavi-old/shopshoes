class ProductsController < ApplicationController
	def new
		@produto = Product.new
	end

	def create
		@product = Product.new(product_params)

		if @product.save!
			render json: {:status => "ok"}
		else
			render json: {:status => "falhou"}
		end
	end

	private

	def product_params
		params.require(:product).permit(:nome, :descricao, :imagem, :preco, :quantidade)
	end
end
