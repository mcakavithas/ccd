class AddAgeColumnToDeposits < ActiveRecord::Migration
  def change
    add_column :deposits, :age, :integer
  end
end
