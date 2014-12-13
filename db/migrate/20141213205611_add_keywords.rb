class AddKeywords < ActiveRecord::Migration
  def change
    add_column :users, :keywords, :text, array: true, default: []
  end
end
