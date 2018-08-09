class Cargo < ApplicationRecord
	has_and_belongs_to_many :funcionarios
end