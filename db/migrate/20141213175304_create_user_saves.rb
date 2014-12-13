class CreateUserSaves < ActiveRecord::Migration
  def change
    create_table :user_saves do |t|
      t.integer :user_id
      t.integer :tip_id

      t.timestamps
    end
    add_index :user_saves, :user_id
    add_index :user_saves, :tip_id
  end
end
