class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.integer :amount
      t.float :roi
      t.integer :n
      t.integer :periods
      t.integer :total
      t.timestamps
    end
  end
end
