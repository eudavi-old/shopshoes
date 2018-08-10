class AddFuncionariosAndSetores < ActiveRecord::Migration[5.1]
  def self.up
    create_table :funcionarios_setors do |t|
      t.references :setor, :funcionario
    end
  end

  def self.down
    drop_table :funcionarios_setors
  end
end
