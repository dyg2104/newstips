class CreateUserViews < ActiveRecord::Migration
  def change
    create_table :user_views do |t|

      t.timestamps
    end
  end
end
