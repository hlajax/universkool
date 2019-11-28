class Etablissement < ApplicationRecord
  mount_uploader :cover, CoverUploader
  mount_uploader :profil, LogoUploader
  mount_uploader :photos, PhotoUploader
    extend FriendlyId
  friendly_id :nom, use: :slugged
  belongs_to :country
  belongs_to :category
  belongs_to :administrateur
  belongs_to :diplome
end
