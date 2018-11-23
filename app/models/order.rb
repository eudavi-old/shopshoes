class Order < ApplicationRecord
	belongs_to :cliente
	has_many :items
	paginates_per 5

	scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
end