class Game < ActiveRecord::Base

  belongs_to :jedi_user_id, foreign_key: 'jedi_user_id', class_name: "User"
  belongs_to :sith_user_id, foreign_key: 'sith_user_id', class_name: "User"
  has_many :ships

end

