class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :nom
      t.string :description
      t.string :slug

      t.timestamps
    end
    add_index :countries, :slug, unique: true
  end
end
