class AddCulumnImageToUsers < ActiveRecord::Migration
  def change
  	add_attachment :users,:image
  	remove_column :users, :image
  end
end
