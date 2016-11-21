class DropTableImages < ActiveRecord::Migration
  def change
  	drop_table :image_profiles
  end
end
