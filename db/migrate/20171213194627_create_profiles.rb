class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.references :profileable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
