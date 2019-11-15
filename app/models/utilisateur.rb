class Utilisateur < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	mount_uploader :bulletin, CoverUploader
	mount_uploader :certificat, CoverUploader
	mount_uploader :carte, CoverUploader
end
