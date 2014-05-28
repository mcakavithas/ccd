class AddMaturityDateColumnToDeposits < ActiveRecord::Migration
  def change
    add_column :deposits, :maturity_date, :date
  end
end
