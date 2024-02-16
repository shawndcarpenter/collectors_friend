class CreateIssues < ActiveRecord::Migration[7.1]
  def change
    create_table :issues do |t|
      t.string :collector_id
      t.string :condition
      t.date :date
      t.string :origin
      t.integer :status
      t.float :price

      t.timestamps
    end
  end
end
