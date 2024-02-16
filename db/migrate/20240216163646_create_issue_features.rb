class CreateIssueFeatures < ActiveRecord::Migration[7.1]
  def change
    create_table :issue_features do |t|
      t.references :issue, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
