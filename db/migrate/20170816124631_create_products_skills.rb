class CreateProductsSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :products_skills do |t|
      t.references :user, foreign_key: true
      t.references :skill, foreign_key: true
      t.timestamps
    end
  end
end
