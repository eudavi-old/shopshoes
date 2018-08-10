class AddFuncionarioIdToEmail < ActiveRecord::Migration[5.1]
  def change
  	add_reference :emails, :funcionario, foreign_key: true
  end
end
