class AddDobColumnToDeposits < ActiveRecord::Migration
  def change
    add_column :deposits, :dob, :date
  end
end
