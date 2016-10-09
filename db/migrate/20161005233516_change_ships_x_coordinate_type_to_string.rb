class ChangeShipsXCoordinateTypeToString < ActiveRecord::Migration
  def change
    change_column :ships, :x_coordinate, :string
    change_column :strikes, :x_coordinate, :string
  end
end
