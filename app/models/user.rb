class User < ApplicationRecord
  # validates_uniqueness_of :mail, :message => "ttotototototot"
  # validates :firstname, presence: true, allow_blank: false

  validates :mail, :uniqueness => true

end