class Country < ApplicationRecord
	  extend FriendlyId
  friendly_id :nom, use: :slugged
	has_many :etablissements
	belongs_to :administrateur
end
