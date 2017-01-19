class Instance < ApplicationRecord

  validates :date, :presence => {message: ": Merci de remplis le champ"}
  validates :town, :presence => {message: ": Merci de remplis le champ"}
  validates :company, :presence => {message: ": Merci de remplis le champ"}

  validates_format_of :town, :with => /\A[\w\s]+\z/i, :message => ": Merci de ne pas faire ça ! "
  validates_format_of :company, :with => /\A[\w\s]+\z/i, :message => ": Merci de ne pas faire ça ! "

end
