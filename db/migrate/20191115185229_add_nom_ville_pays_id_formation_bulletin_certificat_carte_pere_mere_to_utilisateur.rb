class AddNomVillePaysIdFormationBulletinCertificatCartePereMereToUtilisateur < ActiveRecord::Migration[6.0]
  def change
    add_column :utilisateurs, :nom, :string
    add_column :utilisateurs, :ville, :string
    add_column :utilisateurs, :pays_id, :integer
    add_column :utilisateurs, :formation, :string
    add_column :utilisateurs, :bulletin, :string
    add_column :utilisateurs, :certificat, :string
    add_column :utilisateurs, :carte, :string
    add_column :utilisateurs, :pere, :string
    add_column :utilisateurs, :mere, :string
  end
end
