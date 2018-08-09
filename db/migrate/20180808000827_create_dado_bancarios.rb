class CreateDadoBancarios < ActiveRecord::Migration[5.1]
  def change
    create_table :dados_bancarios do |t|
      t.string :conta

      t.timestamps
    end
  end
end
