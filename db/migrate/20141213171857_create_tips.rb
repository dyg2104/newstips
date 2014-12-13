class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :name
      t.text :text, null: false
      t.string :email
      t.string :city
      t.string :state

      t.timestamps
    end

    add_index :tips, :name
    add_index :tips, :city
    add_index :tips, :state

  end
end
