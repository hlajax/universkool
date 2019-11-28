class AddSlugToDiplome < ActiveRecord::Migration[6.0]
  def change
    add_column :diplomes, :slug, :string
    add_index :diplomes, :slug, unique: true
  end
end
