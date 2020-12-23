class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name, null: false
      t.integer :item_category_id, null: false
      t.integer :price, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :shipping_area_id, null: false
      t.integer :days_to_ship_id, null: false
      t.text :item_explanation, null: false
      t.integer :product_condition_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
