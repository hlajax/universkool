class Demande < ApplicationRecord
	extend FriendlyId
  friendly_id :objet, use: :slugged
end
