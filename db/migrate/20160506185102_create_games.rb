class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.integer :game_id
      t.integer :jedi_user
      t.integer :sith_user

      t.timestamps
    end
  end
end
