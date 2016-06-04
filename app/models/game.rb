class Game < ActiveRecord::Base
  
  validates :validate_sith_user_or_jedi_user, presence: true

  belongs_to :jedi_user, foreign_key: 'jedi_user_id', class_name: "User"
  belongs_to :sith_user, foreign_key: 'sith_user_id', class_name: "User"
  has_many :ships


  def validate_sith_user_or_jedi_user
    if self.sith_user_id.blank? && self.jedi_user_id.blank?
      self.errors.add(:jedi_user_id, "At least one player must join the game.")
    elsif self.sith_user_id.present?  || self.jedi_user.present?
      return true
    else
      false
    end
  end

end

