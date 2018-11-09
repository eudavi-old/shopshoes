class Product < ApplicationRecord

	def self.select_product_by_array_id id_product
		where(id: id_product)
	end
end
