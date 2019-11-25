class CreateDiplomes < ActiveRecord::Migration[6.0]
  def change
    create_table :diplomes do |t|
      t.string :titre
      t.text :description

      t.timestamps
    end
  end
end
