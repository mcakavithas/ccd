class RemoveTypeFromDeposits < ActiveRecord::Migration
  def up
    remove_column :deposits, :type
  end

  def down
    add_column :deposits, :type, :string
  end
end
