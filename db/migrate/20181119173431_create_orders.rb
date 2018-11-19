class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.boolean :status
      	t.references :cliente, foreign_key: true
      	
      	t.timestamps
    end
  end
end
