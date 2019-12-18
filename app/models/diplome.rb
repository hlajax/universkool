class Diplome < ApplicationRecord
	extend FriendlyId
  friendly_id :titre, use: :slugged
end
