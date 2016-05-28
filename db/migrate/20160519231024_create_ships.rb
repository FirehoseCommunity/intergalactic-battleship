class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string    :name
      t.integer   :game_id
      t.integer   :user_id
      t.boolean   :vertical?
      t.integer   :x_coordinate
      t.integer   :y_coordinate
      t.timestamps
    end
  end
end
