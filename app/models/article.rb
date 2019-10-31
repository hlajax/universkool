class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :titre, use: :slugged
  mount_uploader :photo, PhotoUploader
  belongs_to :administrateur
end
