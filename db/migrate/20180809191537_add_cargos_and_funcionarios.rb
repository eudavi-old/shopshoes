class AddCargosAndFuncionarios < ActiveRecord::Migration[5.1]
  def self.up
    create_table :cargos_funcionarios do |t|
      t.references :cargo, :funcionario
    end
  end

  def self.down
    drop_table :cargos_funcionarios
  end
end