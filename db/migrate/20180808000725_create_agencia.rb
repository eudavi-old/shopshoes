class CreateAgencia < ActiveRecord::Migration[5.1]
  def change
    create_table :agencia do |t|
      t.string :nome_agencia

      t.timestamps
    end
  end
end
