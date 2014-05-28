class ChangeDataTypeForFieldname < ActiveRecord::Migration
 
  def self.up
    change_table :deposits do |t|
      t.change :periods, :float
    end
  end
  def self.down
    change_table :deposits do |t|
      t.change :periods, :integer
    end
  end
end
