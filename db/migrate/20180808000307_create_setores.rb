class CreateSetores < ActiveRecord::Migration[5.1]
  def change
    create_table :setores do |t|
      t.string :setor
      t.boolean :manipular_funcionario
      t.boolean :manipular_cliente
      t.boolean :manipular_produto
      t.timestamps
    end
  end
end
