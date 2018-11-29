require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	
	fixtures :products

	def test_create_product
		produto = Product.new(
			  :nome => products(:ultramarine).nome, :descricao => products(:ultramarine).descricao,
			  :imagem => products(:ultramarine).imagem, :quantidade => products(:ultramarine).quantidade,
			  :preco => products(:ultramarine).preco, :slug => products(:ultramarine).slug)
		
		msg = "Produto nao foi salvo" + "errors: ${produto.errors.inspect}"

		assert produto.save, msg

		produto_copia = Product.find(produto.id)

		assert_equal produto.nome, produto_copia.nome
	end

	def test_create_product_error
		produto = Product.new(:descricao => products(:react_sail).descricao,
			  :imagem => products(:react_sail).imagem, :quantidade => products(:react_sail).quantidade,
			  :preco => products(:react_sail).preco, :slug => products(:react_sail).slug)

		msg = "Nome não pode ficar em branco"

		produto.save

		assert_equal produto.errors.full_messages[0], msg
		assert_not_nil produto.errors
	end

	def test_update_product
		produto = Product.last

		msg = "O produto é nulo"

		assert_not_nil produto, msg

		assert_equal produto.nome, "Ultramarine"

		produto.update_attributes(:nome => "Ultraviolet")

		assert_equal produto.nome, "Ultraviolet"
	end
end
