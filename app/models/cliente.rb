class Cliente < ApplicationRecord
	has_one :user
	has_many :orders
end
