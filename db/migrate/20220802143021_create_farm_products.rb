class CreateFarmProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :farm_products do |t|
      t.string :title
      t.string :video
      t.boolean :active, default: false
      t.boolean :has_variant, default: false
      t.string :has_single_pricing, default: false
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
