class AddAtachmentToUsers < ActiveRecord::Migration
  def change
  	add_attachment :users, :image
  end
end
