class Game < ActiveRecord::Base
  
  validate :validate_sith_user_or_jedi_user

  belongs_to :jedi_user, foreign_key: 'jedi_user_id', class_name: "User"
  belongs_to :sith_user, foreign_key: 'sith_user_id', class_name: "User"
  has_many :ships

  scope :unjoined_games, -> { where("jedi_user_id is NULL or sith_user_id is NULL")}

  def validate_sith_user_or_jedi_user
    if self.sith_user.blank? && self.jedi_user.blank?
      self.errors.add(:jedi_user_id, "At least one player must join the game.")
    end
  end

  # def waiting_for_player?
  #   jedi_user.nil? || sith_user.nil?
  # end

  # def pending_games
  #   @pending_games = Game.where("jedi_user_id IS NULL OR sith_user_id IS NULL")
  # end

end

