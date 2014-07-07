class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :value, null: false
      t.string :image
      t.integer :listing_category_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
