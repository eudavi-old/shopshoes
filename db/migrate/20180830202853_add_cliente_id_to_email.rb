class AddClienteIdToEmail < ActiveRecord::Migration[5.1]
  def change
  	add_reference :emails, :cliente, foreign_key: true
  end
end
