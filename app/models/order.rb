class Order < ApplicationRecord
	belongs_to :cliente
	has_many :items
	paginates_per 5
end