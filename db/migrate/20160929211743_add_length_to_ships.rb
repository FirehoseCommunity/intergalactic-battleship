class AddLengthToShips < ActiveRecord::Migration
  def change
    add_column :ships, :length, :integer
  end
end
