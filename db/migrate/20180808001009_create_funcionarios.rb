class CreateFuncionarios < ActiveRecord::Migration[5.1]
  def change
    create_table :funcionario do |t|
      t.integer :cpf
      t.string :nome
      t.float :salario
      t.date :data_nasc
      t.string :login
      t.string :senha
      t.integer :cep
      t.string :logradouro
      t.integer :num_logradouro
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :pais

      t.timestamps
    end
  end
end
