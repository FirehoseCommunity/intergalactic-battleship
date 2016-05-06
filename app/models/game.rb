class Game < ActiveRecord::Base

  belongs_to :jedi_user
  belongs_to :sith_user
  has_many :ships
  
end
