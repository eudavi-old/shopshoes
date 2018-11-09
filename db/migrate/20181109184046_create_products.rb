class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :nome
      t.string :descricao
      t.string :imagem
      t.integer :quantidade
      t.float :preco

      t.timestamps
    end
  end
end
