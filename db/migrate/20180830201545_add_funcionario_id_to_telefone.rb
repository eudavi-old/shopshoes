class AddFuncionarioIdToTelefone < ActiveRecord::Migration[5.1]
  def change
  	add_reference :telefones, :funcionario, foreign_key: true
  end
end
