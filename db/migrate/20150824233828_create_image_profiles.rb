class CreateImageProfiles < ActiveRecord::Migration
  def change
    create_table :image_profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false      
    end
    add_attachment :image_profiles, :image
  end
end
