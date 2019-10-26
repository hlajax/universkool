class CreateEtablissements < ActiveRecord::Migration[6.0]
  def change
    create_table :etablissements do |t|
      t.string :nom
      t.text :description
      t.string :profil
      t.string :cover
      t.string :telephone
      t.string :email
      t.string :site
      t.string :adresse
      t.string :slug
      t.references :country, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :etablissements, :slug, unique: true
  end
end
