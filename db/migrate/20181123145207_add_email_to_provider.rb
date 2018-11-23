class AddEmailToProvider < ActiveRecord::Migration[5.1]
  def change
  	 add_column :providers, :email, :string
  end
end
