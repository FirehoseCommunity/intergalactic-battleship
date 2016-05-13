class CreateGames < ActiveRecord::Migration
 
  def change
    create_table :games do |t|

      t.integer :jedi_user_id
      t.integer :sith_user_id

      t.timestamps
    end
  end
end
