class AddCollectionIdToIssues < ActiveRecord::Migration[7.1]
  def change
    add_reference :issues, :collection, null: false, foreign_key: true
  end
end
