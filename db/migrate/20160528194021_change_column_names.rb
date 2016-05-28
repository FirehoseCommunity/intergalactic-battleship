class ChangeColumnNames < ActiveRecord::Migration
  def change
    rename_column :games, :jedi_user_id, :jedi_user
    rename_column :games, :sith_user_id, :sith_user
  end
end
