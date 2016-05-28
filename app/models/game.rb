class Game < ActiveRecord::Base
  validates :jedi_user_id, presence: true
  validates :sith_user_id, presence: true
  
  belongs_to :jedi_user, foreign_key: 'jedi_user_id', class_name: "User"
  belongs_to :sith_user, foreign_key: 'sith_user_id', class_name: "User"
  has_many :ships

end

