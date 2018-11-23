module OrdersHelper
	def preco_final order
		preco_final = 0
		order.items.each do |item|
			preco_final += item.preco_final
		end
		preco_final
	end

	def post_date(data)
		data.strftime("%d/%m/%Y")
	end
end
