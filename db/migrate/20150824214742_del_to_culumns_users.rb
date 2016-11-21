class DelToCulumnsUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :img_profile_file_name
  	remove_column :users, :img_profile_content_type
  	remove_column :users, :img_profile_file_size
  	remove_column :users, :img_profile_updated_at
  	add_column :users, :image, :text
  end
end
