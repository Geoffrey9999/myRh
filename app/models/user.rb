class User < ApplicationRecord

  validates :mail, :presence => {message: ": Merci de remplis le champ"}, :uniqueness => { message: ": Le mail est déjà utilisé !"}
  validates :firstname, :presence => {message: ": Merci de remplis le champ"}
  validates :lastname, :presence => {message: ": Merci de remplis le champ"}
  validates :birthdate, :presence => {message: ": Merci de remplis le champ"}
  validates_format_of :firstname, :with => /\A[\w\s]+\z/i, :message => ": Merci de ne pas faire ça ! "
  # validates_format_of :birthdate, :with => /\A(?:0?[1-9]|1[0-2])\/(?:0?[1-9]|[1-2]\d|3[01])\/\d{4}\z/i, :message => ": Merci de ne pas faire ça ! "
  validates_format_of :lastname, :with => /\A[\w\s]+\z/i, :message => ": Merci de ne pas faire ça ! "
end