class CreateStrikes < ActiveRecord::Migration
  def change
    create_table :strikes do |t|
      t.integer       :user_id 
      t.integer       :x_coordinate
      t.integer       :y_coordinate
      t.integer       :game_id
      t.boolean       :hit

      t.timestamps
    end
  end
end
