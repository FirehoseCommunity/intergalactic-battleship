class Game < ActiveRecord::Base
  
  validate :validate_sith_user_or_jedi_user
  validate :users_must_be_different, :on => :update

  belongs_to :jedi_user, foreign_key: 'jedi_user_id', class_name: "User"
  belongs_to :sith_user, foreign_key: 'sith_user_id', class_name: "User"
  has_many :ships

  scope :unjoined_games, -> { where("jedi_user_id is NULL or sith_user_id is NULL")}

  def validate_sith_user_or_jedi_user
    if self.sith_user.blank? && self.jedi_user.blank?
      self.errors.add(:jedi_user_id, "At least one player must join the game.")
      # should above error be added to ':base'?
    end
  end


  def initialize_board(game, user)
    Ship.create(name: "Destroyer", x_coordinate: 1, y_coordinate: 1, game_id: game, user_id: user, length: 2, vertical?: false)
    Ship.create(name: "Cruiser", x_coordinate: 1, y_coordinate: 2, game_id: game, user_id: user, length: 3, vertical?: false)
    Ship.create(name: "Fighter", x_coordinate: 1, y_coordinate: 3, game_id: game, user_id: user, length: 3, vertical?: false)
    Ship.create(name: "Battleship", x_coordinate: 1, y_coordinate: 4, game_id: game, user_id: user, length: 4, vertical?: false)
    Ship.create(name: "Carrier", x_coordinate: 1, y_coordinate: 5, game_id: game, user_id: user, length: 5, vertical?: false)
  end



  def users_must_be_different
    return unless sith_user_id == jedi_user_id
    errors.add(:base, 'Jedi and Sith users cannot be the same!')
  end

end

