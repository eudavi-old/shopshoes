class CreateSetors < ActiveRecord::Migration[5.1]
  def change
    create_table :setors do |t|
      t.string :setor

      t.timestamps
    end
  end
end
