class AddTitleToIssue < ActiveRecord::Migration[7.1]
  def change
    add_column :issues, :title, :string
  end
end
