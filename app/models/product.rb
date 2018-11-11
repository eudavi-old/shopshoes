class Product < ApplicationRecord
	def self.select_product_by_array_id id_product
		where(id: id_product)
	end

	def self.slug string
		string = string.downcase
		string = string.gsub(/\s+/, "-")
		string = I18n.transliterate(string)
	end
end
