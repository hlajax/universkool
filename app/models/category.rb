class Category < ApplicationRecord
	  extend FriendlyId
  friendly_id :titre, use: :slugged
	has_many :etablissements
end
