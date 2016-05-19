class DropShips < ActiveRecord::Migration
  def change
    drop_table :ships
  end
end
