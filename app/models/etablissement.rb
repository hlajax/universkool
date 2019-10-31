class Etablissement < ApplicationRecord
  mount_uploader :cover, CoverUploader
  mount_uploader :profil, LogoUploader
    extend FriendlyId
  friendly_id :nom, use: :slugged
  belongs_to :country
  belongs_to :category
   belongs_to :administrateur
end
