class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :nome
      t.string :cnpj
      t.string :cpf
      t.string :cep
      t.string :logradouro
      t.string :num_logradouro
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :pais

      t.timestamps
    end
  end
end
