class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :description
      t.date :date_of_birth
      t.integer :price
      t.string :phone_number
      t.text :address
      t.string :city
      t.string :postal_code
      t.string :lat
      t.string :lng
      t.string :height
      t.string :weight
      t.string :shoes
      t.string :eyes
      t.string :hair
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
