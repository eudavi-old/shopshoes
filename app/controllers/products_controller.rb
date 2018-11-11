class ProductsController < ApplicationController

	before_action :set_product, only: [:show]

	def new
		@produto = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.slug = Product.slug(@product.nome)

		if @product.save!
			render json: {:status => "ok"}
		else
			render json: {:status => "falhou"}
		end
	end

	def show; end

	private

	def set_product
		@product = Product.find_by slug: params[:slug]
	end

	def product_params
		params.require(:product).permit(:nome, :descricao, :imagem, :preco, :quantidade)
	end
end
