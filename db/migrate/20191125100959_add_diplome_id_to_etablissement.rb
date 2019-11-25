class AddDiplomeIdToEtablissement < ActiveRecord::Migration[6.0]
  def change
    add_column :etablissements, :diplome_id, :integer
  end
end
