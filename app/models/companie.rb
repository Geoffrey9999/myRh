class Companie < ApplicationRecord
  has_many :instance, dependent: :destroy
end
