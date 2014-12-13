class CreateUserViews < ActiveRecord::Migration
  def change
    create_table :user_views do |t|
      t.integer :user_id
      t.integer :tip_id

      t.timestamps
    end
    add_index :user_views, :user_id
    add_index :user_views, :tip_id
  end
end
