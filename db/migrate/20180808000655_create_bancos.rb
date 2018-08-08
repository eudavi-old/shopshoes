class CreateBancos < ActiveRecord::Migration[5.1]
  def change
    create_table :bancos do |t|
      t.string :nome_banco

      t.timestamps
    end
  end
end
