class ChangeShipsXCoordinateTypeToInteger < ActiveRecord::Migration
  def change
    Ship.where(x_coordinate: 'A').update_all(x_coordinate: 1)
    Strike.where(x_coordinate: 'A').update_all(x_coordinate: 1)
    change_column :ships, :x_coordinate, 'integer USING CAST(x_coordinate AS integer)'
    change_column :strikes, :x_coordinate, 'integer USING CAST(x_coordinate AS integer)'
  end
end
