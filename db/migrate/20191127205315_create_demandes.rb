class CreateDemandes < ActiveRecord::Migration[6.0]
  def change
    create_table :demandes do |t|
      t.string :nom
      t.string :telephone
      t.string :email
      t.string :objet
      t.text :contenu

      t.timestamps
    end
  end
end
