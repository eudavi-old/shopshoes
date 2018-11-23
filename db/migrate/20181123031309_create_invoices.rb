class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.float :valor
      t.string :tipo_conta

      t.timestamps
    end
  end
end
