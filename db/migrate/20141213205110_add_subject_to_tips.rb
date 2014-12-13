class AddSubjectToTips < ActiveRecord::Migration
  def change
    add_column :tips, :subject, :string
  end
end
