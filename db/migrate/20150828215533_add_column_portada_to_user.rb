class AddColumnPortadaToUser < ActiveRecord::Migration
  def change
  	add_attachment :users, :portada
  end
end
