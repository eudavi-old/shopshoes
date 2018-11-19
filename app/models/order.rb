class Order < ApplicationRecord
	belongs_to :cliente
	has_many :items
end