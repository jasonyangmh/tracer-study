class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :birthplace
      t.date :birthdate
      t.integer :gender
      t.text :address
      t.string :phone_number
      t.string :major
      t.string :graduation_year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
