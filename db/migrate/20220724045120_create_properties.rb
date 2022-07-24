class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :operation_type, default: 0
      t.integer :property_type, default: 0
      t.integer :price
      t.integer :maintenance, default: 0
      t.integer :bedrooms_count
      t.integer :bathrooms_count
      t.integer :area
      t.boolean :pets_allowed, default: true
      t.text :description
      t.boolean :active_published, default: true
      t.string :address
      t.float :latitude, default: 0.0
      t.float :longitude, default: 0.0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
