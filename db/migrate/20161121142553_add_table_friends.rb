class AddTableFriends < ActiveRecord::Migration
  def change
  	create_table "friends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
	end
  end
end
